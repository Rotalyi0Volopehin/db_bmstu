SELECT prod_name, prod_measure, prod_col, prod_col*prod_price
FROM product_report JOIN supermarket using (prod_id)
WHERE rep_year=$year_input AND rep_month=$month_input;