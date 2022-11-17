SELECT MAX(order_id) AS max_id
    FROM user_orders
    WHERE user_id = '$user_id'