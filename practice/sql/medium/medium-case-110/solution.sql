-- Xom Data · Classify products by sales velocity
-- Problem: https://xomdata.com/practice/medium-case-110
-- Solved: 2026-09-15

WITH product_totals AS (
    SELECT
        p.name,
        p.categories,
        SUM(t.quantity) AS total_sold
    FROM products p
    INNER JOIN transactions t ON t.product_id = p.id
    GROUP BY p.name, p.categories
)
SELECT
    name,
    categories,
    total_sold,
    CASE 
        WHEN total_sold >= 100 THEN 'Best Seller'
        WHEN total_sold >= 50  THEN 'Average'
        ELSE 'Slow Mover'
    END AS classification,
    DENSE_RANK() OVER (PARTITION BY categories ORDER BY total_sold DESC) AS rank_in_cat,
    ROUND(
        total_sold * 100.0 / SUM(total_sold) OVER (PARTITION BY categories),2) AS pct_of_cat_total
FROM product_totals
ORDER BY categories ASC, rank_in_cat ASC, name ASC;
