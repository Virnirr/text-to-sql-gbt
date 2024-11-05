import streamlit as st
import backend

st.set_page_config(page_title="Chatbot", page_icon="🤖", layout="wide")
st.title("Text to SQL GPT")


if 'chat_history' not in st.session_state: #see if the chat history hasn't been created yet
    st.session_state.chat_history = [] #initialize the chat history

chat_container = st.container()

input_text = st.chat_input("What can I help you with today?") #display a chat input box

if input_text:
    backend.chat_with_model(message_history=st.session_state.chat_history, query=input_text)


#Re-render the chat history (Streamlit re-runs this script, so need this to preserve previous chat messages)
for message in st.session_state.chat_history: #loop through the chat history
    with chat_container.chat_message(message.role): #renders a chat line for the given role, containing everything in the with block
        st.markdown(message.text) #display the chat content
