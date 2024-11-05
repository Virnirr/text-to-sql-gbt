
from openai import OpenAI
import os
from dotenv import load_dotenv

load_dotenv()

openai_client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

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


def chat_with_model(message_history, query=None):
        
    new_text_message = ChatMessage('user', text=query)
    message_history.append(new_text_message)
    
    number_of_messages = len(message_history)
    
    if number_of_messages > MAX_MESSAGES:
        del message_history[0 : (number_of_messages - MAX_MESSAGES) * 2] #make sure we remove both the user and assistant responses
    

    context = "Create tables that you think is appropriate for the questions asked and output the schemas you have created."
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