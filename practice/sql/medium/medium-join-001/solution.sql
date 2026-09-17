-- Xom Data · Customer spending per order
-- Problem: https://xomdata.com/practice/medium-join-001
-- Solved: 2026-09-17

with cte1 as (
    select
        full_name,
        count(o.id) as order_count,
        sum(total_amount) as total_spending,
        avg(total_amount) as avg_order_value
    from customers c
    left join orders o ON o.customer_id = c.id
    GROUP BY full_name
)
select 
    full_name,
    order_count,
    total_spending,
    avg_order_value,
    ROW_NUMBER() over(ORDER BY total_spending desc, full_name asc) as spending_rank
from cte1
order by spending_rank asc
