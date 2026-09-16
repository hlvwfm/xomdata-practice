-- Xom Data · Orders with customer names
-- Problem: https://xomdata.com/practice/easy-join-001
-- Solved: 2026-09-16

-- Write your SQL here
select order_code, customer_name, amount
from customers c
inner join orders o ON o.customer_id = c.id
