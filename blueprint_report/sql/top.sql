SELECT menu_name, menu_report_amount, menu_report_summary_price, menu_report_date
FROM menu_report JOIn menu USING (menu_id)