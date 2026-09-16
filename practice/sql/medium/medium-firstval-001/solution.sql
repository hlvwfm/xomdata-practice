-- Xom Data · The category's flagship next to each item
-- Problem: https://xomdata.com/practice/medium-firstval-001
-- Solved: 2026-09-16

with cte1 as (
    select 
        category,
        product_name, 
        ROW_NUMBER() over(PARTITION BY category ORDER BY price desc, product_name asc) as hang
    from catalog
),
cte2 as (
    select 
        category,
        product_name as top_product
    from cte1
    where hang = 1
)
select 
    c.category,
    product_name,
    price,
    top_product
from catalog c 
left join cte2 on cte2.category = c.category
order by c.category asc, price desc, product_name asc
