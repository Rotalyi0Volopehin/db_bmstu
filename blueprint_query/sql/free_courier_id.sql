SELECT courier_id
FROM courier
WHERE courier_id IN (SELECT DISTINCT courier_id FROM pizza_order RIGHT JOIn courier USING (courier_id) WHERE courier_id not in (SELECT courier_id FROM pizza_order RIGHT JOIn courier USING (courier_id) WHERE order_status_deliver = "no"))
AND courier_name ='$namer' AND courier_surname='$surnamer'
AND (courier_date_end > CURRENT_DATE OR courier_date_end IS NULL);