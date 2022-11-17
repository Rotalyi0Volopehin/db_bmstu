SELECT product_report.prod_name, product_report.prod_measure, product_report.prod_col, product_report.prod_col*product_report.prod_price
FROM product_report JOIN supermarket using (prod_id)
WHERE rep_year='$year_input' AND rep_month='$month_input';