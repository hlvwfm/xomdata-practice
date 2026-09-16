-- Xom Data · Total spend per member
-- Problem: https://xomdata.com/practice/easy-leftjoin-002
-- Solved: 2026-09-16

-- Write your SQL here
select member_name, 
    case when amount is not null then sum(amount) else 0 end as total_spent
from members m 
left join bills b ON b.member_id = m.id
group by member_name
order by member_name asc;
