import psycopg2 as pg


def insert_course(cur, cnum, name, dept, breadth):
    cur.execute(
        f"insert into course values ('{cnum}', '{name}', '{dept}', '{breadth}')"
    )


def get_all_courses(cur):
    cur.execute("select * from course")
    return cur.fetchall()


if __name__ == "__main__":
    conn = pg.connect(
        dbname="yusufakin",
        user="yusufakin",
        password="",
        host="localhost",
        port="5432",
        options="-c search_path=university",
    )

    cur = conn.cursor()
    get_all_courses(cur)
    # cnum = input("Cnum: ").strip()
    # name = input("Name: ").strip()
    # dept = input("Dept: ").strip()
    # breadth = input("Breadth: ").strip()
    #
    # try:
    #     insert_course(cur, cnum, name, dept, breadth)
    #     conn.commit()
    # except pg.Error as e:
    #     print(e)
    # finally:
    #     cur.close()
    #     conn.close()
