-- Xom Data · Low-activity users
-- Problem: https://xomdata.com/practice/medium-subquery-160
-- Solved: 2026-09-15

with cte1 as (select
    user_name,
    COUNT(o.id) as order_count,
    SUM(value) as total_value,
    AVG(value) as avg_order_value,
    avg_value
FROM users u
LEFT JOIN orders o ON o.user_id = u.id
CROSS JOIN (select SUM(value)/COUNT(DISTINCT(user_id)) as avg_value from orders) as temp_avg_value
GROUP BY user_name)
select 
    user_name, order_count,
    total_value, avg_order_value,
    CASE
        WHEN total_value is NULL THEN 'Inactive'
        WHEN total_value < avg_value THEN 'Low'
        ELSE 'Normal'
    END as tier,
    RANK() OVER(ORDER BY total_value asc) as activity_rank,
    ROUND(PERCENT_RANK() OVER (ORDER BY total_value) * 100, 2) AS pct_above_peers
FROM cte1
WHERE total_value IS NULL or total_value < avg_value
ORDER BY activity_rank asc, user_name asc
