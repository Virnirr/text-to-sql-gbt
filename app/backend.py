
from openai import OpenAI
import os
from dotenv import load_dotenv
import sqlite3

load_dotenv()

openai_client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

def get_create_table_statements(db_path):
    # Connect to the database
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()

    # Get all table names
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = cursor.fetchall()

    # Dictionary to store the CREATE TABLE statements
    create_statements = {}

    for table in tables:
        table_name = table[0]
        
        # Get column info
        cursor.execute(f"PRAGMA table_info({table_name});")
        columns = cursor.fetchall()
        
        # Get foreign key info
        cursor.execute(f"PRAGMA foreign_key_list({table_name});")
        foreign_keys = cursor.fetchall()
        
        # Build the CREATE TABLE statement
        create_stmt = f"CREATE TABLE {table_name} (\n"
        
        # Add column definitions
        column_defs = []
        for col in columns:
            col_def = f"  {col[1]} {col[2]}"
            if col[3]:  # Check if NOT NULL
                col_def += " NOT NULL"
            if col[4] is not None:  # Default value
                col_def += f" DEFAULT {col[4]}"
            if col[5]:  # Primary key
                col_def += " PRIMARY KEY"
            column_defs.append(col_def)
        
        # Add foreign key constraints
        for fk in foreign_keys:
            fk_def = f"  FOREIGN KEY ({fk[3]}) REFERENCES {fk[2]}({fk[4]})"
            if fk[5] != "NO ACTION":
                fk_def += f" ON UPDATE {fk[5]}"
            if fk[6] != "NO ACTION":
                fk_def += f" ON DELETE {fk[6]}"
            column_defs.append(fk_def)
        
        create_stmt += ",\n".join(column_defs)
        create_stmt += "\n);"
        
        # Store the CREATE TABLE statement in the dictionary
        create_statements[table_name] = create_stmt

    # Close the connection
    conn.close()

    context = ""
    
    for table_name, create_stmt in create_statements.items():
        context += f"Table: {table_name}" + "\n"
        context += create_stmt + "\n"
    
    return context


def retrieve(query):
    '''
    Retrieve the message query from GPT model
    '''
    return openai_client.chat.completions.create(
                model="ft:gpt-3.5-turbo-0125:rodrigo-canaan-research::9U9NBrdJ",
                messages=[{"role": "user", "content": query}],
                max_tokens=1000,
            )


# fetch context from the response
def get_contexts(retrievalResults):
    contexts = []
    for retrievedResult in retrievalResults: 
        contexts.append(retrievedResult['content']['text'])
    return contexts



def build_prompt(query, context):
    return f"""

    Use the following pieces of information to provide a concise answer to the question enclosed in <question> tags.

    Given this information in between <context></context> tags:
    <context>
    {context}
    </context>

    Ensure each statement ends with a semicolon (`;`) and format each statement as a single line without line breaks. Avoid SQL injection vulnerabilities:

    
    <question>
    {query}
    </question>

    Make sure to print out the SQL schema you have created.
    SQL Code:
    """


modelId = 'anthropic.claude-3-sonnet-20240229-v1:0' # change this to use a different version from the model provider
accept = 'application/json'
contentType = 'application/json'


MAX_MESSAGES = 20

class ChatMessage(): #create a class that can store image and text messages
    def __init__(self, role, text):
        self.role = role
        self.text = text

cached_context = ""

def chat_with_model(message_history, query=None):
    global cached_context
    new_text_message = ChatMessage('user', text=query)
    message_history.append(new_text_message)
    
    number_of_messages = len(message_history)
    
    if number_of_messages > MAX_MESSAGES:
        del message_history[0 : (number_of_messages - MAX_MESSAGES) * 2] #make sure we remove both the user and assistant responses

    if len(message_history) <= 2:
        try:
            cached_context = get_create_table_statements(f"database/{query}/{query}.sqlite")
        except:
            cached_context = get_create_table_statements(f"database/academic/academic.sqlite")
        
        response_chat_message = ChatMessage("assistant", "```" + f"Context of {query} is: \n: " + cached_context + "```" )
        message_history.append(response_chat_message)

        return cached_context

    else:
        context = cached_context
        # context = get_contexts(retrievalResults)
        prompt = build_prompt(query, context)

        response = retrieve(prompt)
        response_body = response.choices[0].message.content.strip().split(";")

        predicted_select = ""

        for selectStatement in response_body:
            if selectStatement == "":
                continue
            # print("-----------------------------------------")
            # print(selectStatement + ";")
            predicted_select += selectStatement + ";" + "\n"

        # response_text = response_body.get('content')[0]['text']  
        response_chat_message = ChatMessage('assistant', predicted_select)

        message_history.append(response_chat_message)
    
    return response_body