import os

from string import Template


class SQLProvider:
    def __init__(self, file_path: str) -> None: # из директории file_path считает нам все sql-шаблоны
        self._scripts = {}  # пустой словарь
        print('file_path', file_path)
        for file in os.listdir(file_path):  # цикл по всем файлам в директории
            self._scripts[file] = Template(open(f'{file_path}/{file}').read())  #создает словарь {имя_файла_где_sql_запрос_лежит : файл sql_запрос}.

    def get(self, name, **kwargs) -> str:
        return self._scripts.get(name, '').substitute(**kwargs)  # подстановка именованных параметров sql в запрос через substitute