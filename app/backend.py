import boto3
import pprint
from botocore.client import Config
import json

pp = pprint.PrettyPrinter(indent=2)
session = boto3.session.Session()
region = session.region_name
bedrock_config = Config(connect_timeout=120, read_timeout=120, retries={'max_attempts': 0})
bedrock_client = boto3.client('bedrock-runtime', region_name = region)
bedrock_agent_client = boto3.client("bedrock-agent-runtime",
                              config=bedrock_config, region_name = region)

kb_id = 'W8QG45SEBO'
modelId = 'anthropic.claude-3-sonnet-20240229-v1:0' # change this to use a different version from the model provider

def retrieve(query, kbId, numberOfResults=5):
    return bedrock_agent_client.retrieve(
        retrievalQuery= {
            'text': query
        },
        knowledgeBaseId=kbId,
        retrievalConfiguration= {
            'vectorSearchConfiguration': {
                'numberOfResults': numberOfResults,
                'overrideSearchType': "HYBRID", # optional
            }
        }
    )


# fetch context from the response
def get_contexts(retrievalResults):
    contexts = []
    for retrievedResult in retrievalResults: 
        contexts.append(retrievedResult['content']['text'])
    return contexts



def build_prompt(query, context):
    return f"""
    Human: You are a seasoned software engineer working on a complex project. 
    You've just encountered a persistent bug in the system that's causing unexpected behavior. 
    Your task is to approach this problem methodically, identifying potential causes, checking logs,
    reviewing recent changes in the code, and applying any necessary debugging techniques to isolate and fix the issue. 
    Please walk through your thought process and actions as you work to resolve this bug.
    
    Use the following pieces of information to provide a concise answer to the question enclosed in <question> tags. 
    If you don't know the answer, just say that you don't know, don't try to make up an answer.
    <context>
    {context}
    </context>

    <question>
    {query}
    </question>

    The response should be specific and use statistics or numbers when possible.

    Assistant:"""


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
    
    
    response = retrieve(query, kb_id, 5)
    retrievalResults = response['retrievalResults']
    context = get_contexts(retrievalResults)
    prompt = build_prompt(query, context)
    messages=[{ "role":'user', "content":[{'type':'text','text': prompt}]}]
    sonnet_payload = json.dumps({
        "anthropic_version": "bedrock-2023-05-31",
        "max_tokens": 512,
        "messages": messages,
        "temperature": 0.5,
        "top_p": 1
    })
    response = bedrock_client.invoke_model(
        body=sonnet_payload, 
        modelId=modelId, 
        accept=accept, 
        contentType=contentType
        )
    response_body = json.loads(response.get('body').read())
    response_text = response_body.get('content')[0]['text']  
    response_chat_message = ChatMessage('assistant', response_text)

    message_history.append(response_chat_message)
    
    return