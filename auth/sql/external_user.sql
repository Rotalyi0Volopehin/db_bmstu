select user_id, NULL as user_group,user_name from external_user where ex_user_login ='$login' and ex_user_password = '$password'