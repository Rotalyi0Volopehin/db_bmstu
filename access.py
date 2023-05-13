from functools import wraps

from flask import session, render_template, current_app, request, redirect, url_for


# THIS IS DECORATOR
def login_required(func):
    @wraps(func)
    def wrapper(*args, **kwargs):  # абстрактная функция проверяющая непустой id для текущей сессии
        if 'user_id' in session:
            return func(*args, **kwargs)
        return redirect(url_for('blueprint_auth.start_auth'))

    return wrapper


def group_validation(config: dict) -> bool:  # проверяем наличие группы у внутренних пользователей
    endpoint_app = request.endpoint.split('.')[1]
    print("wow is ",request.endpoint.split('.')[0])
    print("ENDPOINT IS", endpoint_app)
    if 'user_group' in session:
        user_group = session['user_group']
        if user_group in config and endpoint_app in config[user_group]:
            return True
    return False


# THIS IS DECORATOR
def group_required(f):  # проверка чтобы внешние пользователи не залезли к внутренним
    @wraps(f)
    def wrapper(*args, **kwargs):
        config = current_app.config['access_config']
        if group_validation(config):
            return f(*args, **kwargs)
        return render_template('exceptions/internal_only.html')

    return wrapper


def external_validation(config):  # проверка для клиентов (внешних пользователей)
    if len(request.endpoint.split('.')) > 1:
        endpoint_app = request.endpoint.split('.')[1]
    else:
        endpoint_app = request.endpoint.split('.')[0]
    user_id = session.get('user_id', None)  # у словарика сессии забираем значения
    user_group = session.get('user_group', None)
    print("USER IS IN ", user_group)
    if user_id and user_group is None:
        print(endpoint_app)
        if endpoint_app in config['client']:
            return True
    return False


# THIS IS DECORATOR
def external_required(f):  # проверка чтобы внутренние сотрудники не залезли к внешним
    @wraps(f)
    def wrapper(*args, **kwargs):
        config = current_app.config['access_config']
        if external_validation(config):
            return f(*args, **kwargs)
        return render_template('exceptions/external_only.html')

    return wrapper
