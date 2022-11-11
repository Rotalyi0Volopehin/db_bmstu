from flask import Blueprint, render_template

from access import group_required, admin_required, ceo_required

blueprint_report = Blueprint('blueprint_report', __name__, template_folder='templates')


@blueprint_report.route('/report_create_1')
@admin_required
def report_create_1():
    return render_template('report_create_1.html')


@blueprint_report.route('/report money')
@ceo_required
def report_financial():
    return render_template('executive_user_menu.html')


@blueprint_report.route('/report quality')
@ceo_required
def report_top():
    return render_template('executive_user_menu.html')


@blueprint_report.route('/report employee')
@ceo_required
def report_efficiency():
    return render_template('executive_user_menu.html')


@blueprint_report.route('/scp-173')
@ceo_required
def the_first_scp():
    return render_template('SCP-173.html')
