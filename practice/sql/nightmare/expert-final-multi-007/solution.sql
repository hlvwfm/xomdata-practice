-- Xom Data · Top 2 salespeople by sales each month
-- Problem: https://xomdata.com/practice/expert-final-multi-007
-- Solved: 2026-09-15

with cte1 as (
    select
        month, employee_id, full_name, SUM(revenue) as total_sales
    FROM sales s 
    INNER JOIN employees e ON e.id = s.employee_id
    GROUP BY month, employee_id
),

cte2 as (select month,
    DENSE_RANK() OVER(PARTITION BY month ORDER BY total_sales desc) as hang,
    employee_id, full_name, total_sales
    from cte1)
select month, hang, employee_id, full_name, total_sales
from cte2
where hang <3
ORDER BY month asc, hang asc, employee_id asc;
