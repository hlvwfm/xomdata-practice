-- Xom Data · Monthly income and expense report
-- Problem: https://xomdata.com/practice/medium-groupby-080
-- Solved: 2026-09-15

WITH
  cte1 AS (
    SELECT
      strftime('%Y-%m', transaction_date) AS month,
      SUM(
        CASE
          WHEN type = 'Income' THEN amount
          ELSE 0
        END
      ) AS total_income,
      SUM(
        CASE
          WHEN type = 'Expense' THEN amount
          ELSE 0
        END
      ) AS total_expense
    FROM
      transactions t1
    GROUP BY
      month
  )
SELECT
  month,
  total_income,
  total_expense,
  total_income - total_expense AS balance,
  sum(total_income - total_expense) OVER (
    ORDER BY
      month ASC
  ) AS cumulative_balance,
  CASE
    WHEN total_income - total_expense > 0 THEN 'Surplus'
    WHEN total_income - total_expense < 0 THEN 'Deficit'
    ELSE 'Balanced'
  END AS status
FROM
  cte1
