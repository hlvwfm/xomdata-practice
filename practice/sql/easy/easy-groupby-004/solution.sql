-- Xom Data · Which sales channel leads in orders
-- Problem: https://xomdata.com/practice/easy-groupby-004
-- Solved: 2026-09-16

-- Write your SQL here
select channel, count(*) as num_orders
from orders
GROUP BY channel
order by num_orders desc, channel asc
