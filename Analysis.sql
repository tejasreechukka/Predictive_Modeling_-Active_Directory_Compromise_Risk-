CREATE OR REPLACE VIEW `ecom_funnel_data.user_paths`
AS
with Userpath as (
  select user_id,
  MAX(case when lower(event_type) = 'view' then 1 else 0 end) as Viewed,
  MAX(CASE WHEN LOWER(EVENT_TYPE) = 'cart' then 1 else 0 end) as added_cart,
  MAX(CASE WHEN LOWER(event_type) = 'remove_from_cart' then 1 else 0 end) as removed_cart,
  MAX(CASE WHEN LOWER(event_type) = 'purchase' then 1 else 0 end) as purchased
  from `ecom_funnel_data.clickstream_logs`
  group by user_id
)
select 
  'view' as step, sum(viewed) as users_action
  from Userpath
  union all
select 
  'cart' as step, sum(added_cart) as users_action
  from Userpath
union all
select
  'remove_from_cart' as step, sum(removed_cart) as users_action
  from Userpath
union all
select
  'purchase' as step, sum(purchased) as users_action
  from Userpath
ORDER BY users_action DESC;