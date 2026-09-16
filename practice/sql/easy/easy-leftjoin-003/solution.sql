-- Xom Data · Booking count per branch
-- Problem: https://xomdata.com/practice/easy-leftjoin-003
-- Solved: 2026-09-16

-- Write your SQL here
select branch_name, coalesce(COUNT(branch_id), 0) as num_bookings
from branches b 
left join bookings bo ON bo.branch_id = b.id
group by branch_name
order by branch_name asc
