from flask import Blueprint, render_template, request, current_app, session, redirect, url_for
from sql_provider import SQLProvider
from access import login_required, group_required
from db_work import call_proc, select_dict, select
import os

blueprint_report = Blueprint('bp_report', __name__, template_folder='templates')

provider = SQLProvider(os.path.join(os.path.dirname(__file__), 'sql'))


@blueprint_report.route('/', methods=['GET', 'POST'])
@login_required
@group_required
def start_report():
    rep_list = current_app.config['report_list']['reports']
    rep_url_dict = current_app.config['report_url']
    if request.method == 'GET':
        group = session.get('user_group')
        if group == 'admin':
            return render_template('menu/report_admin.html', report_list=rep_list)
        return render_template('menu/report_marketer.html', report_list=rep_list)
    else:
        rep_id = request.form.get('rep_id')
        if request.form.get('create_rep'):
            url = rep_url_dict[rep_id]['create_report']
        else:
            url = rep_url_dict[rep_id]['view_report']
        return redirect(url_for(url))


@blueprint_report.route('/create/product_report', methods=['GET', 'POST'])
@login_required
@group_required
def create_product_report():
    if request.method == 'GET':
        return render_template('reports/product_report_form.html')
    else:
        date_str = request.form.get('month_num')
        if date_str:
            year, month = date_str.split('-')
            _sql = provider.get('product_report_check.sql', year_input=year, month_input=month)
            result = select_dict(current_app.config['dbconfig'], _sql)
            if result[0]['COUNT(*)'] == 0:
                if call_proc(current_app.config['dbconfig'], 'product_report', month, year):
                    return render_template('report_created.html')
            else:
                return render_template('reports/product_report_form.html', error='Отчет уже создан в системе')
        return render_template('reports/product_report_form.html', error='Повторите ввод')


@blueprint_report.route('/view/product_report', methods=['GET', 'POST'])
@login_required
@group_required
def view_product_report():
    if request.method == 'GET':
        return render_template('reports/product_report_form.html')
    else:
        date_str = request.form.get('month_num')
        if date_str:
            year, month = date_str.split('-')
            _sql = provider.get('product_report_view.sql', year_input=year, month_input=month)
            result, schema = select(current_app.config['dbconfig'], _sql)
            if result:
                return render_template('reports/product_report_view.html', month=month, year=year, result=result)
            else:
                return render_template('reports/product_report_form.html',
                                       error='За указанный период отчет отсутствует')
        else:
            return render_template('reports/product_report_form.html', error='Повторите ввод')
