SELECT dispatcher_name, dispatcher_surname, dispatcher_ex, dispatcher_telephone
FROM dispatcher WHERE dispatcher_date_end > CURRENT_DATE OR dispatcher_date_end IS NULL;