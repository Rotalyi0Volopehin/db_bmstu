SELECT order_date_create,order_time_arrive,order_summary_price,order_meals_amount,order_status_deliver,order_client_mark
FROM pizza_order WHERE client_id = $user_id;