import os
from typing import Optional, Dict

from flask import Blueprint, request, render_template, current_app, session, redirect, url_for, flash

from database.operations import select
from database.sql_provider import SQLProvider

blueprint_auth = Blueprint('blueprint_auth', __name__, template_folder='templates')
provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))


@blueprint_auth.route('/', methods=['GET', 'POST'])
def start_auth():
    if request.method == 'GET':  # очевидно, что вначале надо принять данные от пользователя - даем ему голую форму
        return render_template('input_login.html', message='')
    else:
        login = request.form.get('login')
        password = request.form.get('password')
        if login:
            user_info = define_user(login, password)
            if not password:
                return render_template('input_login.html', message='Отдай пароль')
            if user_info:
                user_info = define_name(user_info)
                user_dict = user_info[0]
                session['user_id'] = user_dict['user_id']
                session['user_group'] = user_dict['user_group']
                session['user_name'] = user_dict['user_name']
                _name = session['user_name']
                _text = ""
                if "'" in str(password):
                    _text += "Поздравляю, вы сломали наши пароли. "
                if "'" in str(login):
                    _text += 'Поздравляю, вы умнее - и сломали даже логины. '
                if session['user_group'] and _text:
                    _text += 'Мы дали вам права сис. админа. Почините нам все. Сис. админа зовут ' + _name
                elif _text:
                    _text += 'Вы в аккаунте пользователя ' + _name + '. Исход 20:1-18; 31:18'
                if session['user_group'] == 'admin':
                    _text += ' Фонд SCP. '
                if session['user_group'] == 'admin' and ("'" in str(password) or "'" in str(login)):
                    _text += ' Отряд девятихвостой лисы выехал к вам! '
                if not _text:
                    _text += _name
                flash(_text)
                session.permanent = True
                return redirect(url_for('menu_choice'))
            else:
                return render_template('input_login.html', message='Пользователь или пароль не найден')
        return render_template('input_login.html', message='Повторите ввод')


def define_user(login: str, password: str):
    sql_internal = provider.get('internal_user.sql', login=login, password=password)
    sql_external = provider.get('external_user.sql', login=login, password=password)

    user_info = None

    for sql_search in [sql_internal, sql_external]:
        _user_info = select(current_app.config['db_config'], sql_search)
        if _user_info:
            user_info = _user_info
            break

    return user_info


def define_name(user_info):

    dict_info = user_info[0]
    if not(dict_info['user_group']):
        dict_info['user_group'] = 'client'
    table_name = dict_info['user_group']
    table_col_id = dict_info['user_group']+'_id'
    table_col_name = dict_info['user_group'] + '_name'

    sql_name = provider.get('user_name.sql', tabler=table_name, namer=table_col_name, ider=table_col_id, user_id=dict_info['user_id'])
    universal_name = select(current_app.config['db_config'], sql_name)

    if universal_name:
        user_info[0]['user_name'] = universal_name[0][table_col_name]

    return user_info
