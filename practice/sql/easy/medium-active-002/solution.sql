-- Xom Data · Ai ghé đủ cả hai tháng liền nhau
-- Problem: https://xomdata.com/practice/medium-active-002
-- Solved: 2026-09-16

SELECT customer_id
FROM orders
WHERE strftime('%Y-%m', order_date) IN ('2024-03', '2024-04')
GROUP BY customer_id
HAVING COUNT(DISTINCT strftime('%Y-%m', order_date)) = 2;
