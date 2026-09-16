-- Xom Data · The customer's joining month on every order
-- Problem: https://xomdata.com/practice/medium-cohort-001
-- Solved: 2026-09-16

WITH
  cte1 AS (
    SELECT
      customer_name,
      strftime('%Y-%m', min(order_date)) AS month
    FROM
      orders
    group BY
      customer_name
  )
SELECT
  cte1.customer_name,
  order_date,
  month AS cohort_month
FROM
  cte1
  INNER JOIN orders o ON o.customer_name = cte1.customer_name
ORDER BY
  cte1.customer_name ASC,
  order_date ASC
