from typing import Tuple, List
from db_context_manager import DBContextManager


def select(db_config: dict, sql: str) -> Tuple[Tuple, List[str]]:
    """
    это типо реализация select из sql только на питоне (хз зачем так сложно)
    select запрос к БД с указанным конфигом и sql-запросом.
        db_config - Конфиг для подключения к БД - это словарь
        sql- SQL-запрос.
    """
    result = tuple()
    schema = []
    with DBContextManager(db_config) as cursor:
        if cursor is None:
            raise ValueError('Cursor not found')
        cursor.execute(sql)
        schema = [column[0] for column in cursor.description]
        result = cursor.fetchall()
    return result, schema #возвращает список(точнее кортеж) с результатом запроса (result) и описанием колонок запроса (schema - это список заголовков таблицы)