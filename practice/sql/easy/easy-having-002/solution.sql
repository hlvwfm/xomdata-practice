-- Xom Data · Customers reaching the loyalty milestone
-- Problem: https://xomdata.com/practice/easy-having-002
-- Solved: 2026-09-16

-- Write your SQL here
with cte1 as (select customer_name, sum(amount) as total_spent 
from purchases 
GROUP BY customer_name)
select customer_name, total_spent 
from cte1 
where total_spent >= 5000000
order by total_spent desc, customer_name asc
