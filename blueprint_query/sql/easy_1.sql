SELECT order_date_create as 'пп',order_time_arrive,order_time_ordery,order_summary_price,order_meals_amount,order_status_deliver,order_client_mark
FROM pizza_order WHERE client_id = $user_id;