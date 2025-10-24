create or replace view ecom_funnel_data.event_type_per_month as
select count(distinct user_id) as users_count,
  format_date('%Y-%m',event_time) as month,
  event_type
  from `ecom_funnel_data.clickstream_logs`
  group by month, event_type
  order by MONTH DESC;