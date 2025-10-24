CREATE OR REPLACE VIEW ecom_funnel_data.monthly_sales as
SELECT
  TIMESTAMP_TRUNC(t0.event_time, MONTH) AS sales_month,
  t0.event_type,
  ROUND(SUM(t0.price), 2) AS total_sales
FROM
  `robotic-augury-476017-j6`.`ecom_funnel_data`.`clickstream_logs` AS t0
GROUP BY
  sales_month,
  t0.event_type
ORDER BY
  sales_month;