import os  # работа с объектами операционной системы

from flask import Flask, Blueprint, request, render_template, current_app, flash, session  # глобальная переменная с конфигом app
from db_work import select
from database.sql_provider import SQLProvider
from access import group_required, admin_required, deliver_required, ceo_required, external_required, deliver_required

blueprint_query = Blueprint('blueprint_query', __name__, template_folder='templates')  # создание blueprint'а

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))  # создание словаря для текущего blueprint'а


#@blueprint_query.route('/', methods=['GET', 'POST'])
@blueprint_query.route('/queries', methods=['GET', 'POST'])
@external_required
def queries():
    if request.method == 'GET':
        return render_template('product_form.html')
    else:
        input_product = request.form.get('product_name')
        print('YHE PRODUCT IS ',input_product)
        _sql = provider.get('easy_2.sql', input_product=input_product)
        product_result, schema = select(current_app.config['db_config'], _sql)
        if input_product and product_result:
            return render_template('db_result.html', schema=schema, result=product_result)
        else:
            flash('Повторите ввод')
            return render_template('product_form.html', message='xxx')


@blueprint_query.route('/history', methods=['GET', 'POST'])
@external_required
def client_history():
    user_id = session['user_id']
    if user_id:
        _sql = provider.get('easy_1.sql', user_id=user_id)
        product_result, schema = select(current_app.config['db_config'], _sql)
        return render_template('client_history_order.html', schema=schema, result=product_result)


@blueprint_query.route('/clients')
@admin_required
def show_clients():
    _sql = provider.get('easy_3.sql')
    product_result, schema = select(current_app.config['db_config'], _sql)
    return render_template('clients.html', schema=schema, result=product_result)


@blueprint_query.route('/online orders')
@admin_required
def show_online_orders():
    _sql = provider.get('easy_4.sql')
    product_result, schema = select(current_app.config['db_config'], _sql)
    return render_template('online_orders.html', schema=schema, result=product_result)


@blueprint_query.route('/free couriers')
@admin_required
def show_free_couriers():
    _sql = provider.get('easy_5.sql')
    product_result, schema = select(current_app.config['db_config'], _sql)
    print(_sql)
    print(product_result)
    return render_template('online_couriers.html', schema=schema, result=product_result)


@blueprint_query.route('/admins')
@deliver_required
def show_admins():
    _sql = provider.get('easy_6.sql')
    product_result, schema = select(current_app.config['db_config'], _sql)
    return render_template('administrators.html', schema=schema, result=product_result)


@blueprint_query.route('/my orders')
@deliver_required
def show_courier_orders():
    user_id = session['user_id']
    if user_id:
        _sql = provider.get('easy_7.sql', user_id=user_id)
        product_result, schema = select(current_app.config['db_config'], _sql)
        return render_template('client_history_order.html', schema=schema, result=product_result)


@blueprint_query.route('/why you bully me', methods=['GET', 'POST'])
@ceo_required
def fire():
    if request.method == 'GET':
        return render_template('employee_form.html')
    else:
        input_name = request.form.get('fullname')
        input_job = request.form.get('job')
        product_result = None
        _sql = provider.get('easy_2.sql', input_product=input_name)
        product_result, schema = select(current_app.config['db_config'], _sql)
        print(product_result, input_name)
        if input_name and product_result:
            flash('Стоило попытаться')
            return render_template('employee_form.html')
        else:
            flash('Повторите ввод')
            return render_template('employee_form.html')
