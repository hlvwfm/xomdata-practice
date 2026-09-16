-- Xom Data · Parcels bound for Denver
-- Problem: https://xomdata.com/practice/easy-join-002
-- Solved: 2026-09-16

-- Write your SQL here
select tracking_code, recipient_name
from recipients r
inner join parcels p on p.recipient_id = r.id
where city = 'Denver'
