-- Xom Data · Opening order or returning order
-- Problem: https://xomdata.com/practice/medium-cohort-002
-- Solved: 2026-09-16

-- Write your SQL here
with cte1 as (select customer_name, order_date, amount, ROW_NUMBER () OVER(PARTITION BY customer_name order by order_date asc) stt
    from orders)
select customer_name, order_date, amount, 
    case
    when stt = 1 then 'New'
    else 'Returning'
    end as order_type
from cte1
order by customer_name asc, order_date asc
