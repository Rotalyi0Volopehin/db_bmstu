# import antigravity

import json
from flask import Flask, render_template, session, redirect, url_for
from access import login_required, external_required, group_required, admin_required
from blueprint_auth.routes import blueprint_auth
from blueprint_report.routes import blueprint_report
from blueprint_query.routes import blueprint_query

app = Flask(__name__)
app.secret_key = 'stampede3stampede2stampede1'

app.register_blueprint(blueprint_auth, url_prefix='/auth')
app.register_blueprint(blueprint_report, url_prefix='/reports')
app.register_blueprint(blueprint_query, url_prefix='/queries')

app.config['db_config'] = json.load(open('configs/db.json'))
app.config['access_config'] = json.load(open('configs/access.json'))


@app.route('/exit', methods=['GET', 'POST'])
@login_required
def exit_func():
    session.clear()
    print('EXIT')
    return redirect(url_for('menu_choice'))
    #return render_template('base.html')


@app.route('/', methods=['GET', 'POST'])
@login_required
def menu_choice():
    print(session.get('user_group') )
    if session.get('user_group') == 'dispatcher':
        return render_template('admin_user_only.html')

    if session.get('user_group', None):
        return render_template('internal_user_menu.html')

    return render_template('external_user_menu.html')


@app.route('/order', methods=['GET', 'POST'])
@external_required
def order():
    return render_template('order-2.html')


@app.route('/faq')
def faq():
    return render_template('faq.html')


@app.route('/contacts')
def contacts():
    return render_template('contacts.html')


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5001)
