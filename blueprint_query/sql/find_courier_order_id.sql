SELECT order_id
FROM pizza_order JOIN internal_user ON courier_id = owner_courier_id
WHERE user_id = $user_id AND order_id = $id AND order_status_deliver="no";