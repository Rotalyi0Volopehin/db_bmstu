import os

from flask import Blueprint, render_template, current_app, request, flash
from access import group_required
from database.sql_provider import SQLProvider
from database.operations import select, call_proc, commit, select_full

blueprint_report = Blueprint('blueprint_report', __name__, template_folder='templates')
provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))


@blueprint_report.route('/report_create', methods=['GET', 'POST'])
@group_required
def report_create():
    if request.method == 'GET':
        return render_template('report_create.html')
    else:
        report = request.form.getlist('report')
        for item in report:
            report = item
        date_str = request.form.get('month_num')
        print(report, date_str)
        if date_str:
            year, month = date_str.split('-')
            if report == '1':
                _sql = provider.get('top_order_check.sql', date=date_str)
                result = select(current_app.config['db_config'], _sql)
                print("1",result)
                if result[0]['COUNT(*)'] > 0:
                    _sql = provider.get('top_check.sql', date=date_str)
                    result = select(current_app.config['db_config'], _sql)
                    print("2",result)
                    if result[0]['COUNT(*)'] == 0:

                        if call_proc(current_app.config['db_config'], 'reported', month, year):

                            flash('Отчёт успешно создан')
                            return render_template('report_create.html')
                    else:
                        flash('Отчёт за указанный период уже создан')
                        return render_template('report_create.html')
            elif report == '2':
                _sql = provider.get('profit_check.sql', date=date_str)
                result = select(current_app.config['db_config'], _sql)
                print("1", result)
                if result[0]['COUNT(*)'] == 0:

                    if call_proc(current_app.config['db_config'], 'money', month, year):

                        flash('Отчёт успешно создан')
                        return render_template('report_create.html')
                else:
                    flash('Отчёт за указанный период уже создан')
                    return render_template('report_create.html')
            else:
                flash('Данных за указанный период не существует')
                return render_template('report_create.html')
        flash('Повторите ввод')
        return render_template('report_create.html')


@blueprint_report.route('/report money', methods=['GET', 'POST'])
@group_required
def report_financial():
    if request.method == 'GET':
        return render_template('report_result_2.html')
    else:
        date = request.form.get('month_num')
        _sql = provider.get('profit.sql',date=date)
        print(_sql)
        product_result, schema = select_full(current_app.config['db_config'], _sql)
        schema = ["Доходы","Расходы на курьеров","Расходы на диспетчеров","Расходы на управляющих","Прибыль", "Дата отчёта" ]
        return render_template('report_result_2.html',schema=schema, result=product_result)


@blueprint_report.route('/report quality', methods=['GET', 'POST'])
@group_required
def report_top():
    if request.method == 'GET':
        return render_template('report_result_1.html')
    else:
        date = request.form.get('month_num')
        _sql = provider.get('top.sql',date=date)
        print(_sql)
        product_result, schema = select_full(current_app.config['db_config'], _sql)
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
