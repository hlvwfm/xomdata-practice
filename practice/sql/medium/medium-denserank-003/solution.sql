-- Xom Data · Spending tiers of loyal customers
-- Problem: https://xomdata.com/practice/medium-denserank-003
-- Solved: 2026-09-16

with cte1 as (select 
    customer_name,
    sum(amount) as total_spent
    from purchases
    GROUP BY customer_name
)
select 
    customer_name, 
    total_spent,
    DENSE_RANK() over(ORDER BY total_spent desc) as spend_tier
from cte1
ORDER BY spend_tier asc, customer_name asc
