import pymysql
from typing import List

from .connection import UseDatabase


def select(db_config: dict, sql: str) -> List:
    result = []
    with UseDatabase(db_config) as cursor:

        if cursor is None:
            raise ValueError('Курсор не создан')

        cursor.execute(sql)
        schema = [column[0] for column in cursor.description]

        for row in cursor.fetchall():
            result.append(dict(zip(schema, row)))

    return result


def update(dbconfig: dict, _sql:str):
    result = []
    with UseDatabase(dbconfig) as cursor:
        if cursor in None:
            raise ValueError('Курсор не создан')
        print('CURSOR',cursor)
        cursor.execute(_sql)

        result = cursor.execute(_sql)
    return result


def commit(commition):
    connection = pymysql.connect(
        host = "127.0.0.1",
        port=3306,
        user="root",
        password="root",
        db="toto_pizza",
        cursorclass=pymysql.cursors.DictCursor
    )
    with connection.cursor() as cursor:
        cursor.execute(commition)
        connection.commit()
