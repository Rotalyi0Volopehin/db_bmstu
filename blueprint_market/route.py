from flask import Blueprint, render_template, request, current_app, session, redirect, url_for
from sql_provider import SQLProvider
from db_context_manager import DBContextManager
from db_work import select_dict, insert
from access import login_required, external_required
import os

blueprint_market = Blueprint('bp_market', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))


@blueprint_market.route('/', methods=['GET', 'POST'])
@login_required
@external_required
def order_index():
    db_config = current_app.config['dbconfig']
    if request.method == 'GET':
        sql = provider.get('all_items.sql')
        items = select_dict(db_config, sql)
        basket_items = session.get('basket', {})
        return render_template('basket_order_list.html', items=items, basket=basket_items)
    else:
        prod_id = request.form['prod_id']
        sql = provider.get('all_items.sql')
        items = select_dict(db_config, sql)  # каждый раз снова лезем в БД

        add_to_basket(prod_id, items)  # {'prod_id' : {'prod_name' : < >, 'prod_price' : < >, 'amount' : < >}}
        # todo Накопление цены добавляемых товаров

        return redirect(url_for('bp_market.order_index'))


def add_to_basket(prod_id: str, items: dict):
    item_description = [item for item in items if str(item['prod_id']) == str(prod_id)]
    item_description = item_description[0]
    curr_basket = session.get('basket', {})

    if prod_id in curr_basket:
        curr_basket[prod_id]['amount'] = curr_basket[prod_id]['amount'] + 1
    else:
        curr_basket[prod_id] = {
            'prod_name': item_description['prod_name'],
            'prod_price': item_description['prod_price'],
            'amount': 1
        }
        session['basket'] = curr_basket
        session.permanent = True
    return True


@blueprint_market.route('/order', methods=['GET', 'POST'])
@login_required
@external_required
def save_order():
    user_id = session.get('user_id')
    current_basket = session.get('basket', {})
    order_id = save_order_with_list(current_app.config['dbconfig'], user_id, current_basket)
    if order_id:
        session.pop('basket')
        return render_template('order_created.html', order_id=order_id)
    else:
        return 'Что-то пошло не так'


@blueprint_market.route('/clear')
@login_required
@external_required
def clear_basket():
    if 'basket' in session:
        session.pop('basket')
    return redirect(url_for('bp_market.order_index'))


def save_order_with_list(dbconfig: dict, user_id: int, current_basket: dict):
    with DBContextManager(dbconfig) as cursor:
        if cursor is None:
            raise ValueError('Курсор не создан')
        _sql1 = provider.get('insert_order.sql', user_id=user_id, order_date='2022-12-02')  # todo Системная дата
        result1 = cursor.execute(_sql1)
        if result1 == 1:  # 1 - кол-во созданных строк
            _sql2 = provider.get('select_order_id.sql', user_id=user_id)
            cursor.execute(_sql2)
            order_id = cursor.fetchall()[0][0]
            if order_id:
                for key in current_basket:
                    prod_amount = current_basket[key]['amount']
                    _sql3 = provider.get('insert_order_list.sql', order_id=order_id, prod_id=key,
                                         prod_amount=prod_amount)
                    cursor.execute(_sql3)
                return order_id
