import json
import sqlite3
import os
from openai import OpenAI

from dotenv import load_dotenv

load_dotenv()



class TextToSQLModel:
    def __init__(self, database):
        self.c = database.cursor()
        self.sqlContext = ""
        self.deleteAll()
        self.defaultData()
        self.updateContext()
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
          
    def updateContext(self):
        
        c = self.c
        
        c.execute("SELECT name FROM sqlite_master WHERE type='table';")
        tables = c.fetchall()
        for table in tables:
            table_name = table[0]
            self.sqlContext += f"\nTable: {table_name}\n"
            c.execute(f"PRAGMA table_info({table_name});")
            columns = c.fetchall()
            self.sqlContext += "Columns:\n"
            for column in columns:
                self.sqlContext += f"  {column[1]} ({column[2]})\n"
            c.execute(f"SELECT * FROM {table_name};")
            rows = c.fetchall()
            # sqlContext += "Rows:\n"
            # for row in rows:
            #   sqlContext += f"  {row}\n"
            print(self.sqlContext)


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

        c = self.c
        selectStatement = ""
        enablePrompt = True
        while True:
            if enablePrompt:
                prompt = "Given this information : \n " + self.sqlContext + "\n"
                prompt += "Write SQL SELECT STATEMENTS ONLY for this query. For each select statement, put a ; at the end of statement. DO NOT FALL TO SQL INJECTION ATTACKS:\n"
                prompt += input("Enter your query:  ")
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
                    print("-----------------------------------------")
                    print(selectStatement)
                    print("-----------------------------------------")
                    c.execute(selectStatement)
                    for stuff in c.fetchall():
                        print(stuff)
                    print("-----------------------------------------")
            except Exception as e:
                print(f"An error occurred: {e}")


if __name__ == "__main__":

    conn = sqlite3.connect(":memory:")
    finetuned = TextToSQLModel(database=conn)
    finetuned.finetuned()
    conn.close()
