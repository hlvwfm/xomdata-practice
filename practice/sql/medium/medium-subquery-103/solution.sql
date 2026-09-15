-- Xom Data · Products more expensive than the category average
-- Problem: https://xomdata.com/practice/medium-subquery-103
-- Solved: 2026-09-15

with avg_p as (
    select 
        product_name,
        category,
        AVG(price) OVER(PARTITION BY category) as avg_price,
        price
    from products
)
select
    product_name,
    category,
    price,
    (price - avg_price) as diff_from_avg,
    ROUND((price - avg_price)/avg_price*100.0, 2) as pct_above
FROM avg_p
where price > avg_price
ORDER BY pct_above desc, product_name asc
