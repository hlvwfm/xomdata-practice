-- Xom Data · Nhịp khách ghé cửa hàng theo tháng
-- Problem: https://xomdata.com/practice/medium-active-001
-- Solved: 2026-09-16

select
    strftime('%Y-%m', order_date) as month,
    count(distinct(customer_id)) as active_customers
from orders
where order_date is not null
GROUP BY month
order by month asc
