def parse_dev(dev_file: str):

  gold_sql = ""
  questions = ""
  with open(dev_file, 'r') as in_file:
    while True:
      question = in_file.readline().split(":  ")[1]
      SQL = in_file.readline().split(":  ")[1]
      blank = in_file.readline()

      gold_sql += SQL
      questions += question

      if not blank:
        break

  with open("dev_gold_sql.txt", 'w') as out_file:
    out_file.write(gold_sql)


  print(question)
  with open("dev_questions.txt", 'w') as out_file:
    out_file.write(questions)

parse_dev("dev.sql")