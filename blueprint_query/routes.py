import json
import os  # работа с объектами операционной системы
import random

from flask import Blueprint, request, render_template, current_app, flash, session  # глобальная переменная с конфигом app
from database.operations import update, commit, select_full, select
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
        _sql = provider.get('find_menu_standart.sql', input_product=input_product)
        product_result, schema = select_full(current_app.config['db_config'], _sql)
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
        product_result, schema = select_full(current_app.config['db_config'], _sql)
        schema = ["Дата заказа", "Время прибытия", "Стоимость заказа", "Количество заказанных блюд", "Заказ доставлен?","Ваша оценка"]
        return render_template('client_history_order.html', schema=schema, result=product_result)
    else:
        flash('Пользователь не найден')
        return render_template('client_history_order.html')


@blueprint_query.route('/clients')
@group_required
def show_clients():
    _sql = provider.get('all_clients.sql')
    product_result, schema = select_full(current_app.config['db_config'], _sql)
    schema = ["Имя", "Фамилия", "Адрес", "Телефон","Дата регистрации","Кол-во заказов"]
    return render_template('clients.html', schema=schema, result=product_result)


@blueprint_query.route('/online orders')
@group_required
def show_online_orders():
    _sql = provider.get('online-orders.sql')
    product_result, schema = select_full(current_app.config['db_config'], _sql)
    schema = ["Имя курьера", "Фамилия курьера","Пол курьера","Телефон курьера","Дата заказа", "Время отбытия", "Стоимость заказа", "Количество заказанных блюд"]
    return render_template('online_orders.html', schema=schema, result=product_result)


@blueprint_query.route('/free couriers')
@group_required
def show_free_couriers():
    _sql = provider.get('free_couriers.sql')
    product_result, schema = select_full(current_app.config['db_config'], _sql)
    schema = ["Имя", "Фамилия","Пол","Телефон"]
    return render_template('online_couriers.html', schema=schema, result=product_result)


@blueprint_query.route('/assign courier', methods=['GET', 'POST'])
@group_required
def assign_courier():
    _sql = provider.get('free_couriers.sql')
    product_result1, schema1 = select_full(current_app.config['db_config'], _sql)
    schema1 = ["Имя", "Фамилия", "Пол", "Телефон"]

    _sql = provider.get('unassigned_orders.sql')
    product_result2, schema2 = select_full(current_app.config['db_config'], _sql)
    schema2 = ["ID заказа", "Дата заказа",
               "Стоимость заказа", "Количество заказанных блюд"]

    if request.method == 'GET':
        print(product_result1, type(product_result1), product_result2)
        return render_template('employee_assign_form.html', schema1=schema1, result1=product_result1, schema2=schema2, result2=product_result2)
    else:
        namer = request.form.get('name')
        surnamer = request.form.get('surname')
        order_id = request.form.get('order')
        order_here = None
        _sql = provider.get('free_courier_id.sql', namer=namer, surnamer=surnamer)
        sql_result = select_full(current_app.config['db_config'], _sql)
        courier_id = None
        if sql_result[0]:
            courier_id = sql_result[0][0][0]
        _sql = provider.get('find_order_id.sql', id=order_id)
        sql_result = select_full(current_app.config['db_config'], _sql)
        if sql_result[0]:
            order_here = sql_result[0][0][0]
        print(order_id, order_here, courier_id)
        if courier_id and order_id and order_here:
            flash('Курьер назначен')
            _sql = provider.get('assign_courier_dispatcher.sql', courier_id=courier_id, dispatcher_id=session['user_id'], id=order_id)
            sql_result = update(current_app.config['db_config'], _sql)
            commit(_sql)

            _sql = provider.get('free_couriers.sql')
            product_result1, schema1 = select_full(current_app.config['db_config'], _sql)
            schema1 = ["Имя", "Фамилия", "Пол", "Телефон"]

            _sql = provider.get('unassigned_orders.sql')
            product_result2, schema2 = select_full(current_app.config['db_config'], _sql)
            schema2 = ["ID заказа", "Дата заказа",
                       "Стоимость заказа", "Количество заказанных блюд"]

            return render_template('employee_assign_form.html', schema1=schema1, result1=product_result1, schema2=schema2, result2=product_result2)
        else:
            flash('Повторите ввод')
            return render_template('employee_assign_form.html', schema1=schema1, result1=product_result1, schema2=schema2, result2=product_result2)


@blueprint_query.route('/admins')
@group_required
def show_admins():
    _sql = provider.get('all_admins.sql')
    product_result, schema = select_full(current_app.config['db_config'], _sql)
    schema = ["Имя", "Фамилия", "Пол", "Телефон"]
    return render_template('administrators.html', schema=schema, result=product_result)


@blueprint_query.route('/my orders')
@group_required
def show_courier_orders():
    user_id = session['user_id']
    if user_id:
        _sql = provider.get('undelivered_orders.sql', user_id=user_id)
        product_result, schema = select_full(current_app.config['db_config'], _sql)
        schema = ["Дата заказа", "Время отбытия", "Количество заказанных блюд", "Стоимость заказа", "Заказ доставлен?", "Заказ оплачен?"]
        return render_template('client_history_order.html', schema=schema, result=product_result)


@blueprint_query.route('/why you bully me', methods=['GET', 'POST'])
@group_required
def fire():
    if request.method == 'GET':
        return render_template('employee_form.html')
    else:
        input_name = request.form.get('fullname')
        input_job = ""
        for item in request.form.get('job'):
            input_job = item
        if input_job == '1':
            input_job = 'courier'
        elif input_job == '2':
            input_job = 'dispatcher'
        elif input_job == '3':
            input_job = 'executive'
        else:
            input_job = None
        if input_name:
            table_id = input_job+'_id'
            table_name = input_job+'_name'
            table_surname = input_job+'_surname'
            try:
                fire_name, fire_surname = input_name.split(" ")
            except Exception:
                flash('Повторите ввод')
                return render_template('employee_form.html')
            print(input_job,table_id,table_name,table_surname,fire_name,fire_surname)
            _sql = provider.get('find_fire.sql', ider=table_id, tabler=input_job, namer=table_name, named=fire_name, surnamer=table_surname, surname=fire_surname)
            print(_sql)
            _result = select(current_app.config['db_config'], _sql)
            print(_result, input_name, input_job)
            if _result and input_job:
                fire_id = _result[0][table_id]
                fire_end = input_job+'_date_end'
                _sql = provider.get('input_fire.sql', ider=table_id, tabler=input_job, id=fire_id, end=fire_end)
                _result = update(current_app.config['db_config'], _sql)
                commit(_sql)
                _sql = provider.get('output_fire.sql', ider=table_id, tabler=input_job, id=fire_id, end=fire_end)
                _result = select(current_app.config['db_config'], _sql)
                if input_job == 'executive':
                    flash(input_name + ' закроет сервис доставки ' + str(_result[0][fire_end]) + '. Ищите новую работу!!!')
                else:
                    flash(input_name+' покинет вас через неделю, а именно '+str(_result[0][fire_end])+'.')
                return render_template('employee_form.html')

        flash('Повторите ввод')
        return render_template('employee_form.html')


@blueprint_query.route('/order', methods=['GET', 'POST'])
@external_required
def order():
    user_id = session['user_id']
    _sql = provider.get('find_menu_standart.sql', user_id=user_id)
    product_result1 = select(current_app.config['db_config'], _sql)
    _sql = provider.get('find_menu_drink.sql', user_id=user_id)
    product_result2 = select(current_app.config['db_config'], _sql)
    _sql = provider.get('find_menu_dessert.sql', user_id=user_id)
    product_result3 = select(current_app.config['db_config'], _sql)

    if request.method == 'GET':
        return render_template('order-2.html', result1=product_result1, result2=product_result2, result3=product_result3)
    else:
        inputt= request.get_json()
        total_quant = 0
        total_sum = 10
        for item in inputt['items']:
            for item_list in item:
                total_quant += int(item_list['quantity'])
                total_sum += int(item_list['unit_price'])*int(item_list['quantity'])

        _sql = provider.get('insert_pizza_order.sql', amount=total_quant,price=total_sum,client_id=user_id,random=random.randint(1,2))
        res = select(current_app.config['db_config'], _sql)
        commit(_sql)

        _sql = provider.get('find_last_order.sql')
        order_id = select(current_app.config['db_config'], _sql)[0]['order_id']
        print("order_id is", order_id)
        for item in inputt['items']:
            for item_list in item:
                item_name = item_list['name']
                print(item_name, type(item_name))
                item_quant = int(item_list['quantity'])

                _sql = provider.get('find_menu_meal_id.sql', name_i=item_name)
                print(_sql)
                insert_id = select(current_app.config['db_config'], _sql)[0]['menu_id']

                _sql2 = provider.get('insert_meal_order.sql', amount=item_quant, menu_id=insert_id, order_id=order_id)
                print(_sql2)
                res = select(current_app.config['db_config'], _sql2)
                print(res)
                commit(_sql2)
        print("end")
        return render_template('success.html')


@blueprint_query.route('/mark', methods=['GET', 'POST'])
@external_required
def set_mark():
    user_id = session['user_id']
    _sql = provider.get('client_history.sql', user_id=user_id)
    product_result1, schema = select_full(current_app.config['db_config'], _sql)
    schema = ["Дата заказа", "Время прибытия", "Стоимость заказа", "Количество заказанных блюд", "Заказ доставлен?",
              "Ваша оценка"]
    _sql = provider.get('client_history_id.sql', user_id=user_id)
    product_result2 = select(current_app.config['db_config'], _sql)
    if user_id:
        if request.method == 'GET':
            print(product_result1, type(product_result1))
            print(product_result2, type(product_result2))
            return render_template('client_mark_order.html', schema1=schema,
                                   result1=zip(product_result1, product_result2),
                                   result2=zip(product_result1, product_result2))
        else:
            order_id = request.form.get('query')
            order_mark = request.form.get('mark')
            print(order_id, order_mark, type(order_mark))
            if order_id and order_mark:
                flash('Оценка заказа изменёна')

                _sql = provider.get('set_mark_order.sql', id=order_id, mark=order_mark)
                sql_result = update(current_app.config['db_config'], _sql)

                commit(_sql)

                _sql = provider.get('client_history.sql', user_id=user_id)
                product_result1, schema = select_full(current_app.config['db_config'], _sql)
                schema = ["Дата заказа", "Время прибытия", "Стоимость заказа", "Количество заказанных блюд",
                          "Заказ доставлен?",
                          "Ваша оценка"]
                _sql = provider.get('client_history_id.sql', user_id=user_id)
                product_result2 = select(current_app.config['db_config'], _sql)

                return render_template('client_mark_order.html', schema1=schema, result1=zip(product_result1, product_result2), result2=zip(product_result1, product_result2))
            else:
                flash('Повторите ввод')
                return render_template('client_mark_order.html', schema1=schema, result1=zip(product_result1, product_result2), result2=zip(product_result1, product_result2))
    else:
        flash('Пользователь не найден')
        return render_template('client_mark_order.html', schema1=schema, result1=zip(product_result1, product_result2), result2=zip(product_result1, product_result2))


@blueprint_query.route('/status order', methods=['GET', 'POST'])
@group_required
def set_courier_order_status():
    user_id = session['user_id']
    _sql = provider.get('undelivered_orders_id.sql', user_id=user_id)
    product_result, schema = select_full(current_app.config['db_config'], _sql)
    schema = ["id заказа", "Дата заказа", "Время отбытия", "Количество заказанных блюд", "Стоимость заказа",
              "Заказ доставлен?", "Заказ оплачен?"]
    if user_id:
        if request.method == 'GET':
            print(product_result, type(product_result))
            return render_template('courier_set_status_form.html', schema1=schema, result1=product_result)
        else:
            order_id = request.form.get('order')
            order_here = None
            _sql = provider.get('find_courier_order_id.sql', id=order_id, user_id=user_id )
            sql_result = select_full(current_app.config['db_config'], _sql)
            if sql_result[0]:
                order_here = sql_result[0][0][0]
            print(order_id, order_here)
            if order_id and order_here:
                flash('Статус заказа изменён')
                _sql = provider.get('set_status_order.sql', id=order_here)
                sql_result = update(current_app.config['db_config'], _sql)
                commit(_sql)

                _sql = provider.get('undelivered_orders_id.sql', user_id=user_id)
                product_result, schema = select_full(current_app.config['db_config'], _sql)
                schema = ["id заказа", "Дата заказа", "Время отбытия", "Количество заказанных блюд", "Стоимость заказа",
                          "Заказ доставлен?", "Заказ оплачен?"]

                return render_template('courier_set_status_form.html', schema1=schema, result1=product_result)
            else:
                flash('Повторите ввод')
                return render_template('courier_set_status_form.html', schema1=schema, result1=product_result)
    else:
        flash('Пользователь не найден')
        return render_template('courier_set_status_form.html')