import sqlite3

def insert_words_to_db(db_name, cursor):
    with open("words.txt") as file:
        for line in file:
            if word_contains_single_quote(line):
                cursor.execute("""INSERT INTO %s VALUES (\"%s\");""" % (db_name, line.strip()));
            else:
                cursor.execute("""INSERT INTO %s VALUES (\'%s\');""" % (db_name, line.strip()));


def word_contains_single_quote(word):
    return "'" in word


def main():
    connection = sqlite3.connect("dictionary.db")
    cursor = connection.cursor()
    cursor.execute("""CREATE TABLE IF NOT EXISTS
                   words(word VARCHAR(50) PRIMARY KEY);""")
    insert_words_to_db("words", cursor)
    connection.commit()


if __name__ == "__main__":
    main()
