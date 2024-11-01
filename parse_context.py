import sqlite3
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
        for column in columns:
            sqlContext += f"  {column[1]} ({column[2]})\n"
        
        schema += "\n" + sqlContext

    return schema

import os
directory = "database"
subdirectories = [directory + "/" + d + "/" + f"{d}.sqlite" for d in os.listdir(directory) if os.path.isdir(os.path.join(directory, d))]

with open("context.sql", 'wt') as out:
    for subdir in subdirectories:
        out.write(get_schema(subdir))