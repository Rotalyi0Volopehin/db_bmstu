import pymysql
from typing import List, Tuple

from .connection import UseDatabase
from .db_context_manager import DBContextManager


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


def call_proc(dbconfig: dict, proc_name: str, *args):
    res = []
    with UseDatabase(dbconfig) as cursor:
        if cursor is None:
            raise ValueError('Курсор не создан')
        param_list = []
        for arg in args:
            param_list.append(arg)
        res = cursor.callproc(proc_name, param_list)
    return res


def select_full(db_config: dict, sql: str) -> Tuple[Tuple, List[str]]:
    """
    это типо реализация select из sql только на питоне (хз зачем так сложно)
    select запрос к БД с указанным конфигом и sql-запросом.
        db_config - Конфиг для подключения к БД - это словарь
        sql- SQL-запрос.
    """
    result = tuple()
    schema = []
    with UseDatabase(db_config) as cursor:
        if cursor is None:
            raise ValueError('Cursor not found')
        cursor.execute(sql)
        schema = [column[0] for column in cursor.description]
        result = cursor.fetchall()
    return result, schema #возвращает список(точнее кортеж) с результатом запроса (result) и описанием колонок запроса (schema - это список заголовков таблицы)
