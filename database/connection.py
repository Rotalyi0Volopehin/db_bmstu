from typing import Optional

from pymysql import connect
from pymysql.cursors import Cursor
from pymysql.err import OperationalError


class UseDatabase:

    def __init__(self, config: dict):
        self.config = config

    def __enter__(self) -> Optional[Cursor]:
        try:
            self.conn = connect(**self.config)
            self.cursor = self.conn.cursor()
            return self.cursor
        except OperationalError as err:
            if err.args[0] == 1045:
                print('Неправильный логин или пароль в конфиге')
            elif err.args[0] == 1049:
                print('Ошибка подключения к бд')
            else:
                print(err)
            return None

    def __exit__(self, exc_type, exc_val, exc_tr): #-> bool:
        if exc_val:
            # print(exc_val)
            # print(exc_type)
            if exc_val.args[0] != 'Курсор не создан':
                self.cursor.close()
                self.conn.close()
        else:
            self.cursor.close()
            self.conn.close()
        return True

