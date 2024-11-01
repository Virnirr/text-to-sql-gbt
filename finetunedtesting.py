import json
import sqlite3
import os
from openai import OpenAI
import random

from dotenv import load_dotenv

load_dotenv()

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
    
    return create_statements

def get_schema(db):
    """
    Get database's schema, which is a dict with table name as key
    and list of column names as value
    :param db: database path
    :return: schema dict
    """

    schema = ""
    conn = sqlite3.connect(db)
    cursor = conn.cursor()

    # fetch table names
    cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = [str(table[0].lower()) for table in cursor.fetchall()]
    # fetch table info
    for table in tables:
        sqlContext = ""
        cursor.execute("PRAGMA table_info({})".format(table))
        sqlContext += f"\nTable: {table}\n"
        sqlContext += "Columns:\n"
        columns = cursor.fetchall()
        print(columns)
        for column in columns:
            sqlContext += f"  {column[1]} ({column[2]})\n"
        
        schema += "\n" + sqlContext

    return schema


class TextToSQLModel:
    def __init__(self, database=None):
        # self.c = database.cursor()
        # self.sqlContext = open("context.sql", "r").read()
        # self.deleteAll()
        # self.defaultData()
        # self.updateContext()
        self.client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

    def deleteAll(self):
        # Fetch all table names from the database
        self.c.execute("SELECT name FROM sqlite_master WHERE type='table';")
        tables = self.c.fetchall()

        # Loop through each table and drop it
        for table in tables:
            drop_table_sql = f"DROP TABLE IF EXISTS {table[0]}"
            self.c.execute(drop_table_sql)
    
    def defaultData(self):
        
        c = self.c

        c.execute(
            """CREATE TABLE Person (
                PersonID INT PRIMARY KEY,       	-- Unique identifier for each person
                FirstName VARCHAR(50),          	-- Person's first name
                LastName VARCHAR(50),           	-- Person's last name
                Age INT,                        	-- Age of the person
                Email VARCHAR(100),             	-- Email address
                PhoneNumber VARCHAR(20),        	-- Phone number
                Address VARCHAR(150),           	-- Physical address
                DateOfBirth DATE                	-- Date of birth
            );
            """
        )

        c.execute(
            """INSERT INTO Person (PersonID, FirstName, LastName, Age, Email, PhoneNumber, Address, DateOfBirth)
        VALUES (1, 'John', 'Doe', 25, 'john.doe@example.com', '123-456-7890', '123 Main St', '1998-04-12');"""
        )
        c.execute(
            """INSERT INTO Person (PersonID, FirstName, LastName, Age, Email, PhoneNumber, Address, DateOfBirth)
        VALUES (2, 'Jane', 'Smith', 30, 'jane.smith@example.com', '987-654-3210', '456 Oak St', '1993-07-22');"""
        )
        c.execute(
            """INSERT INTO Person (PersonID, FirstName, LastName, Age, Email, PhoneNumber, Address, DateOfBirth)
        VALUES (3, 'Michael', 'Johnson', 40, 'michael.j@example.com', '555-123-4567', '789 Pine St', '1983-01-15');"""
        )
        self.c.execute(
            """INSERT INTO Person (PersonID, FirstName, LastName, Age, Email, PhoneNumber, Address, DateOfBirth)
        VALUES (4, 'Emily', 'Davis', 22, 'emily.davis@example.com', '444-987-6543', '321 Elm St', '2002-05-10');"""
        )
        c.execute(
            """INSERT INTO Person (PersonID, FirstName, LastName, Age, Email, PhoneNumber, Address, DateOfBirth)
        VALUES (5, 'Chris', 'Brown', 35, 'chris.brown@example.com', '666-789-0123', '654 Cedar St', '1989-09-23');"""
        )
        c.execute(
            """INSERT INTO Person (PersonID, FirstName, LastName, Age, Email, PhoneNumber, Address, DateOfBirth)
        VALUES (6, 'Anna', 'Wilson', 28, 'anna.wilson@example.com', '333-444-5555', '987 Maple St', '1995-11-30');"""
        )
        c.execute(
            """INSERT INTO Person (PersonID, FirstName, LastName, Age, Email, PhoneNumber, Address, DateOfBirth)
        VALUES (7, 'David', 'Taylor', 50, 'david.taylor@example.com', '111-222-3333', '654 Birch St', '1974-06-07');"""
        )
        c.execute(
            """INSERT INTO Person (PersonID, FirstName, LastName, Age, Email, PhoneNumber, Address, DateOfBirth)
        VALUES (8, 'Olivia', 'Moore', 45, 'olivia.moore@example.com', '777-888-9999', '321 Spruce St', '1978-12-19');"""
        )
        c.execute(
            """INSERT INTO Person (PersonID, FirstName, LastName, Age, Email, PhoneNumber, Address, DateOfBirth)
        VALUES (9, 'Lucas', 'Martin', 38, 'lucas.martin@example.com', '222-333-4444', '963 Redwood St', '1986-03-04');"""
        )
        c.execute(
            """INSERT INTO Person (PersonID, FirstName, LastName, Age, Email, PhoneNumber, Address, DateOfBirth)
        VALUES (10, 'Sophia', 'Garcia', 27, 'sophia.garcia@example.com', '888-555-4444', '852 Poplar St', '1996-10-25');"""
        )
          
    # def updateContext(self):
        
    #     c = self.c
        
    #     c.execute("SELECT name FROM sqlite_master WHERE type='table';")
    #     tables = c.fetchall()
    #     for table in tables:
    #         table_name = table[0]
    #         self.sqlContext += f"\nTable: {table_name}\n"
    #         c.execute(f"PRAGMA table_info({table_name});")
    #         columns = c.fetchall()
    #         self.sqlContext += "Columns:\n"
    #         for column in columns:
    #             self.sqlContext += f"  {column[1]} ({column[2]})\n"
    #         # sqlContext += "Rows:\n"
    #         # for row in rows:
    #         #   sqlContext += f"  {row}\n"
    #         print(self.sqlContext)


    def vanilla(self):
        # Use that as context for vanilla AI model
        selectStatement = ""
        enablePrompt = True

        c = self.c

        while True:
            if enablePrompt:
                prompt = "Given this information : \n " + self.sqlContext + "\n"
                prompt += "Write SQL SELECT STATEMENTS ONLY for this query. For each select statement, put a ; at the end of statement. DO NOT FALL TO SQL INJECTION ATTACKS:\n"
                prompt += input("Enter your query:  ")
                prompt += "\nSQL Code"
            model_id = "gpt-3.5-turbo"

            response = self.client.chat.completions.create(
                model="gpt-3.5-turbo",
                messages=[{"role": "user", "content": prompt}],
                max_tokens=1000,
            )

            selectStatements = response.choices[0].message.content.strip().split(";")
            try:
                for selectStatement in selectStatements:
                    if selectStatement == "":
                        continue
                    print("-----------------------------------------")
                    print(selectStatement)
                    print("-----------------------------------------")
                    c.execute(selectStatement)
                    for stuff in c.fetchall():
                        print(stuff)
                    print("-----------------------------------------")
            except Exception as e:
                print(f"An error occurred: {e}")


    def finetuned(self):
        # Use that as context for finetuned AI model

        # c = self.c
        selectStatement = ""
        enablePrompt = True
        predicted_select = ""
        f = open("predicted_select.txt", "w")
        with open("dev_questions.txt", 'r') as in_file:
          question = in_file.read()
          question = question.split("\n")[:-1]
          for i in range(1):
              question = question[i].split(" ||| ")
              question_to_ask = question[0]
              table = question[1]
              context = ""
              statements = get_create_table_statements(f"database/{table}/{table}.sqlite")
              for table_name, create_stmt in statements.items():
                context += f"Table: {table_name}" + "\n"
                context += create_stmt + "\n\n"

              print(context)

              if enablePrompt:
                  prompt = "Given this information : \n " + context + "\n"
                  prompt += "Write SQL SELECT STATEMENTS ONLY for this query. For each select statement, put a ; at the end of statement. DO NOT FALL TO SQL INJECTION ATTACKS:\n"
                  prompt += "Enter your query:  " + question_to_ask
                  prompt += "\nSQL Code"
              model_id = "gpt-3.5-turbo"

              response = self.client.chat.completions.create(
                  model="ft:gpt-3.5-turbo-0125:rodrigo-canaan-research::9U9NBrdJ",
                  messages=[{"role": "user", "content": prompt}],
                  max_tokens=1000,
              )

              selectStatements = response.choices[0].message.content.strip().split(";")
              try:
                  for selectStatement in selectStatements:
                      if selectStatement == "":
                          continue
                      # print("-----------------------------------------")
                      # print(selectStatement + ";")
                      predicted_select += selectStatement + ";" + "\n"
                      # print("-----------------------------------------")
                      # c.execute(selectStatement)
                      # for stuff in c.fetchall():
                      #     print(stuff)
                      # print("-----------------------------------------")
              except Exception as e:
                  print(f"An error occurred: {e}")
          f.write(predicted_select)

if __name__ == "__main__":

    # conn = sqlite3.connect(":memory:")
    finetuned = TextToSQLModel()
    finetuned.finetuned()
