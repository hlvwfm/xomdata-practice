-- Xom Data · Price tiers for rooms on sale
-- Problem: https://xomdata.com/practice/medium-denserank-001
-- Solved: 2026-09-16

-- Write your SQL here
select
    room_no,
    price,
    DENSE_RANK() over(ORDER BY price desc) as price_tier
from rooms
order by price_tier asc, room_no asc
