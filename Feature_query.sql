--- Feature_query.sql is the sql file with advanced joins and CTE for extracting and data cleansing.
create or replace view `robotic-augury-476017-j6.security_analysis.feature_query_output` as

WITH AggregatedCounts AS (
    SELECT
        user_id,
        -- Feature 1: Total Failed Logins in the dataset period
        SUM(CASE WHEN event_type = 'login_failure' THEN 1 ELSE 0 END) AS total_failed_logins,

        -- Feature 2: Count of Admin Access Requests
        SUM(CASE WHEN event_type = 'admin_access_request' THEN 1 ELSE 0 END) AS total_admin_requests,

        -- Feature 3: Count of Password Changes
        SUM(CASE WHEN event_type = 'password_change' THEN 1 ELSE 0 END) AS total_pwd_changes,

        -- Feature 4: Recent Failed Logins (last 7 days - assuming logs run up to today)
        SUM(CASE WHEN event_type = 'login_failure'
                  AND TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), timestamp, DAY) <= 7
                  THEN 1 ELSE 0 END) AS recent_failed_logins_7d

    FROM
        `robotic-augury-476017-j6.security_analysis.raw_events` -- REPLACE with your Project ID
    GROUP BY
        user_id
),

--- 2. CTE: Calculate Time Since Last Action (Window Function - DATE/TIME)
TimeMetrics AS (
    SELECT
        t1.user_id,
        -- Use MAX to find the timestamp of the last event, then calculate the difference in days
        TIMESTAMP_DIFF(CURRENT_TIMESTAMP(), MAX(t1.timestamp), DAY) AS days_since_last_event,

        -- Calculate Days Since Last Password Change (using a conditional MAX)
        TIMESTAMP_DIFF(CURRENT_TIMESTAMP(),
                       MAX(CASE WHEN t1.event_type = 'password_change' THEN t1.timestamp END),
                       DAY) AS days_since_last_pwd_change
    FROM
        `robotic-augury-476017-j6.security_analysis.raw_events` AS t1 -- REPLACE with your Project ID
    GROUP BY
        t1.user_id
)

--- 3. Final SELECT and JOIN with the Target Variable
SELECT
    A.*,
    T.days_since_last_event,
    T.days_since_last_pwd_change,
    TARGET.is_compromised -- The label for the model (0 or 1)
FROM
    AggregatedCounts AS A
JOIN
    TimeMetrics AS T ON A.user_id = T.user_id
JOIN
    `robotic-augury-476017-j6.security_analysis.user_target` AS TARGET ON A.user_id = TARGET.user_id