-- Xom Data · The current price of each product
-- Problem: https://xomdata.com/practice/medium-dedup-002
-- Solved: 2026-09-16

-- Write your SQL here
with cte1 as (
    select
        product_name,
        price,
        effective_date,
        ROW_NUMBER() over(PARTITION BY product_name order by effective_date desc) as stt
    from price_history
)
select 
    product_name,
        price,
        effective_date
from cte1 
where stt = 1
