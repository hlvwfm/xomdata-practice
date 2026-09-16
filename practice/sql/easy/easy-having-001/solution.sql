-- Xom Data · Categories full enough for the homepage
-- Problem: https://xomdata.com/practice/easy-having-001
-- Solved: 2026-09-16

-- Write your SQL here
select category, count(*) as num_products
from products
GROUP BY category
having num_products >2
ORDER BY category asc
