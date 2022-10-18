from flask import Blueprint, render_template

from access import group_required

blueprint_report = Blueprint('blueprint_report', __name__, template_folder='templates')


@blueprint_report.route('/report_create_1')
@group_required
def report_create_1():
    return render_template('report_create_1.html')


@blueprint_report.route('/report1')
@group_required
def report1():
    return render_template('report_result_1.html')


@blueprint_report.route('/report2')
@group_required
def report2():
    return render_template('report_result_2.html')


@blueprint_report.route('/scp-173')
@group_required
def the_first_scp():
    return render_template('SCP-173.html')
