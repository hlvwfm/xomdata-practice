-- Xom Data · Each customer's latest contact number
-- Problem: https://xomdata.com/practice/medium-dedup-001
-- Solved: 2026-09-16

-- Write your SQL here
with cte1 as (
    select 
    customer_name, 
    phone,
    updated_date,
    ROW_NUMBER () over(PARTITION BY customer_name order by updated_date desc) as stt
    from contact_updates

)
select 
    customer_name, 
    phone,
    updated_date
from cte1
where stt = 1
