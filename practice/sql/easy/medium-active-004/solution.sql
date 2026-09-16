-- Xom Data · Ai chuyên cần suốt cả quý
-- Problem: https://xomdata.com/practice/medium-active-004
-- Solved: 2026-09-16

select customer_id
from orders
where strftime('%Y-%m', order_date) in ('2024-01', '2024-02', '2024-03')
GROUP BY customer_id
having count(DISTINCT(strftime('%Y-%m', order_date))) ==3
