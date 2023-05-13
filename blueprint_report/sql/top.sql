SELECT menu_name, SUM(menu_report_amount), SUM(menu_report_summary_price), menu_report_date
FROM menu_report JOIN menu USING (menu_id) WHERE menu_report_date LIKE '$date%' GROUP BY menu_id