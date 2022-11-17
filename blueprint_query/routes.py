import os  # работа с объектами операционной системы

from flask import Flask, Blueprint, request, render_template, current_app, flash, session  # глобальная переменная с конфигом app
from db_work import select
from database.operations import update, commit
from database.sql_provider import SQLProvider
from access import group_required, external_required

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
        schema = ["Название блюда","Вес (граммы)","Цена (₽)","Количество доступных блюд","Особенность"]
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
        _sql = provider.get('client_history.sql', user_id=user_id)
        product_result, schema = select(current_app.config['db_config'], _sql)
        schema = ["Дата заказа", "Время прибытия", "Стоимость заказа", "Количество заказанных блюд", "Заказ доставлен?","Ваша оценка"]
        return render_template('client_history_order.html', schema=schema, result=product_result)


@blueprint_query.route('/clients')
@group_required
def show_clients():
    _sql = provider.get('easy_3.sql')
    product_result, schema = select(current_app.config['db_config'], _sql)
    schema = ["Имя", "Фамилия", "Адрес", "Телефон","Дата регистрации","Кол-во заказов"]
    return render_template('clients.html', schema=schema, result=product_result)


@blueprint_query.route('/online orders')
@group_required
def show_online_orders():
    _sql = provider.get('easy_4.sql')
    product_result, schema = select(current_app.config['db_config'], _sql)
    schema = ["Имя курьера", "Фамилия курьера","Пол курьера","Телефон курьера","Дата заказа", "Время отбытия", "Стоимость заказа", "Количество заказанных блюд"]
    return render_template('online_orders.html', schema=schema, result=product_result)


@blueprint_query.route('/free couriers')
@group_required
def show_free_couriers():
    _sql = provider.get('easy_5.sql')
    product_result, schema = select(current_app.config['db_config'], _sql)
    schema = ["Имя", "Фамилия","Пол","Телефон"]
    return render_template('online_couriers.html', schema=schema, result=product_result)


@blueprint_query.route('/assign courier', methods=['GET', 'POST'])
@group_required
def assign_courier():
    _sql = provider.get('easy_5.sql')
    product_result1, schema1 = select(current_app.config['db_config'], _sql)
    schema1 = ["Имя", "Фамилия", "Пол", "Телефон"]

    _sql = provider.get('easy_10.sql')
    product_result2, schema2 = select(current_app.config['db_config'], _sql)
    schema2 = ["ID заказа", "Дата заказа",
               "Стоимость заказа", "Количество заказанных блюд"]

    if request.method == 'GET':
        return render_template('employee_assign_form.html', schema1=schema1, result1=product_result1, schema2=schema2, result2=product_result2)
    else:
        namer = request.form.get('name')
        surnamer = request.form.get('surname')
        order_id = request.form.get('order')
        _sql = provider.get('easy_9.sql', namer=namer, surnamer=surnamer)
        sql_result = select(current_app.config['db_config'], _sql)
        courier_id = None
        if sql_result[0]:
            courier_id = sql_result[0][0][0]
        print(order_id, courier_id)
        if courier_id and order_id:
            flash('Курьер назначен')
            _sql = provider.get('update_1.sql', courier_id=courier_id, dispatcher_id=session['user_id'], id=order_id)
            sql_result = update(current_app.config['db_config'], _sql)
            commit(_sql)

            _sql = provider.get('easy_5.sql')
            product_result1, schema1 = select(current_app.config['db_config'], _sql)
            schema1 = ["Имя", "Фамилия", "Пол", "Телефон"]

            _sql = provider.get('easy_10.sql')
            product_result2, schema2 = select(current_app.config['db_config'], _sql)
            schema2 = ["ID заказа", "Дата заказа",
                       "Стоимость заказа", "Количество заказанных блюд"]
            return render_template('employee_assign_form.html', schema1=schema1, result1=product_result1, schema2=schema2, result2=product_result2)
        else:
            flash('Повторите ввод')
            return render_template('employee_assign_form.html', schema1=schema1, result1=product_result1, schema2=schema2, result2=product_result2)


@blueprint_query.route('/admins')
@group_required
def show_admins():
    _sql = provider.get('easy_6.sql')
    product_result, schema = select(current_app.config['db_config'], _sql)
    schema = ["Имя", "Фамилия", "Пол", "Телефон"]
    return render_template('administrators.html', schema=schema, result=product_result)


@blueprint_query.route('/my orders')
@group_required
def show_courier_orders():
    user_id = session['user_id']
    if user_id:
        _sql = provider.get('easy_7.sql', user_id=user_id)
        product_result, schema = select(current_app.config['db_config'], _sql)
        schema = ["Дата заказа", "Время отбытия", "Количество заказанных блюд", "Стоимость заказа", "Заказ доставлен?", "Заказ оплачен?"]
        return render_template('client_history_order.html', schema=schema, result=product_result)


@blueprint_query.route('/why you bully me', methods=['GET', 'POST'])
@group_required
def fire():
    if request.method == 'GET':
        return render_template('employee_form.html')
    else:
        input_name = request.form.get('fullname')
        input_job = request.form.get('job')
        product_result = None
        _sql = provider.get('easy_2.sql', input_product=input_name)
        product_result, schema = select(current_app.config['db_config'], _sql)
        schema = ["Имя", "Фамилия", "Пол", "Телефон"]
        print(product_result, input_name)
        if input_name and product_result:
            flash('Стоило попытаться')
            return render_template('employee_form.html')
        else:
            flash('Повторите ввод')
            return render_template('employee_form.html')
