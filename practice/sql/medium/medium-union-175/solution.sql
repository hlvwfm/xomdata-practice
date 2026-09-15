-- Xom Data · Summary of issues to handle
-- Problem: https://xomdata.com/practice/medium-union-175
-- Solved: 2026-09-15

with cte1 as( select
    type,
    quantity,
    ROUND(quantity*100.0/(SUM(quantity) OVER()), 2) as pct_of_total,
    RANK() OVER(ORDER BY quantity desc) as rank_pos
from (
    select 'Complaint' as type, count(status) as quantity from complaints where status = 'Pending'
    UNION ALL
    select 'Cancelled Order' as type, count(status) as quantity from orders where status = 'Cancelled'
    UNION ALL
    select 'Out of Stock Product' as type, count(status) as quantity from products where status = 'Out of Stock'
) as issues),
cte2 as (
    select
        type,
        SUM(quantity) OVER() as s_quantity,
        SUM(quantity) OVER(ORDER BY rank_pos asc, type asc) as cs_quantity
    FROM cte1
)
select c1.type, quantity, pct_of_total, rank_pos,
    ROUND(cs_quantity*100.0/s_quantity, 2) as cumulative_pct
from cte1 c1
INNER JOIN cte2 c2 on c2.type = c1.type
order by rank_pos asc, c1.type asc
