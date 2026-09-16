-- Xom Data · Customers who ever bought skincare
-- Problem: https://xomdata.com/practice/easy-join-006
-- Solved: 2026-09-16

-- Write your SQL here
SELECT distinct customer_name
from customers c 
inner join purchases p ON p.customer_id = c.id
where category = 'Skincare'
