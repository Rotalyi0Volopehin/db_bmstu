from flask import Flask, request, render_template, json, redirect, url_for, session
from blueprint_query.route import blueprint_query
from blueprint_auth.route import blueprint_auth
from blueprint_market.route import blueprint_market
from blueprint_report.route import blueprint_report
from access import login_required, group_required, external_required
from typing import List, Callable

app = Flask(__name__)
app.secret_key = 'Key'

app.register_blueprint(blueprint_auth, url_prefix='/auth')
app.register_blueprint(blueprint_query, url_prefix='/query')
app.register_blueprint(blueprint_market, url_prefix='/market')
app.register_blueprint(blueprint_report, url_prefix='/report')

with open('configs/dbconfig.json', 'r') as file:
    db_config = json.load(file)
app.config['dbconfig'] = db_config

with open('configs/access.json', 'r') as file:
    access_config = json.load(file)
app.config['access_config'] = access_config

with open('configs/report_list.json', 'r') as file:
    access_config = json.load(file)
app.config['report_list'] = access_config

with open('configs/report_url.json', 'r') as file:
    access_config = json.load(file)
app.config['report_url'] = access_config


@app.route('/')
def start_func():
    if 'user_id' in session:
        return render_template('start_page_auth.html')
    else:
        return render_template('start_page_no_auth.html')


@app.route('/menu')
@login_required
def menu_choice():
    group = session.get('user_group')
    if group == 'admin':
        return render_template('menu/internal_user_admin.html')
    elif group == 'employee':
        return render_template('menu/internal_user_marketer.html')
    return render_template('menu/external_user.html')


@app.route('/exit')
def exit_func():
    session.clear()
    return render_template('exit_request.html')


def add_blueprint_access_handler(_app: Flask, blueprint_names: List[str], handler: Callable) -> Flask:
    for view_func_name, view_func in _app.view_functions.items():  # цикл по всем обработчикам, которые видит _app
        print('view_func_name = ', view_func_name)  # имя функции
        print('view_func = ', view_func)  # объект функции
        view_func_parts = view_func_name.split('.')
        if len(view_func_parts) > 1:
            view_blueprint = view_func_parts[0]
            if view_blueprint in blueprint_names:
                view_func = handler(view_func)  # функция оборачивается в декоратор
                _app.view_functions[view_func_name] = view_func
    return _app


if __name__ == '__main__':
    app = add_blueprint_access_handler(app, ['bp_report'], group_required)  # задание декораторов для всего blueprint'а
    app = add_blueprint_access_handler(app, ['bp_market'], external_required)
    app.run(host='127.0.0.1', port=5001)
