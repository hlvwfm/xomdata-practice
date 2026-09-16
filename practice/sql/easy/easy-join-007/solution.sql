-- Xom Data · Deal count per client
-- Problem: https://xomdata.com/practice/easy-join-007
-- Solved: 2026-09-16

-- Write your SQL here
select client_name, count(*) as num_deals
from clients c
inner join deals d ON d.client_id = c.id
where d.id is not null 
GROUP BY client_name
order by num_deals desc, client_name asc
