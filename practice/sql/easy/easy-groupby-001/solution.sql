-- Xom Data · Headcount per membership plan
-- Problem: https://xomdata.com/practice/easy-groupby-001
-- Solved: 2026-09-16

-- Write your SQL here
select plan, count(*) as num_members
from members
GROUP BY plan
order by plan asc
