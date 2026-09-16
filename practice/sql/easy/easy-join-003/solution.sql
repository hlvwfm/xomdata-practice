-- Xom Data · Line totals from the price list
-- Problem: https://xomdata.com/practice/easy-join-003
-- Solved: 2026-09-15

-- Write your SQL here
SELECT
    product_name,
    quantity,
    quantity*price as line_total
FROM sale_items s 
INNER JOIN products p ON p.id = s.product_id
