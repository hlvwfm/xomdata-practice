-- Xom Data · Users who never took a ride
-- Problem: https://xomdata.com/practice/easy-leftjoin-001
-- Solved: 2026-09-16

-- Write your SQL here
select user_name, joined_date
from users u 
left join rides r ON r.user_id = u.id
where r.user_id is null
