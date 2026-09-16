-- Xom Data · Quarterly sales per employee (2024)
-- Problem: https://xomdata.com/practice/expert-final-agg-001
-- Solved: 2026-09-15

with cte1 as (select
    employee_id, quarter,
    sum(revenue) as s_revenue
from sales
where year = '2024'
GROUP BY employee_id, quarter)
select employee_id, 
    SUM(CASE 
        WHEN quarter = 1 THEN s_revenue ELSE 0
    END) as Q1, 
    SUM(CASE 
        WHEN quarter = 2 THEN s_revenue ELSE 0
    END) as Q2, 
    SUM(CASE 
        WHEN quarter = 3 THEN s_revenue ELSE 0
    END) as Q3, 
    SUM(CASE 
        WHEN quarter = 4 THEN s_revenue ELSE 0
    END) as Q4
from cte1
group by employee_id
ORDER BY employee_id asc;
