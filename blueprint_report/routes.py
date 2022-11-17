import os

from flask import Blueprint, render_template, current_app
from access import group_required
from database.sql_provider import SQLProvider
from db_work import select

blueprint_report = Blueprint('blueprint_report', __name__, template_folder='templates')
provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))


@blueprint_report.route('/report_create')
@group_required
def report_create():
    return render_template('report_create.html')


@blueprint_report.route('/report money')
@group_required
def report_financial():
    return render_template('executive_user_menu.html')


@blueprint_report.route('/report quality')
@group_required
def report_top():
    _sql = provider.get('top.sql')
    product_result, schema = select(current_app.config['db_config'], _sql)
    schema = ["Название блюда","Кол-во заказов блюда", "Прибыль от блюда", "Дата отчёта" ]
    return render_template('report_result_1.html',schema=schema, result=product_result)


@blueprint_report.route('/report employee')
@group_required
def report_efficiency():
    return render_template('executive_user_menu.html')


@blueprint_report.route('/scp-173')
@group_required
def the_first_scp():
    return render_template('SCP-173.html')
