-- Xom Data · Second-highest-paid employee per department
-- Problem: https://xomdata.com/practice/expert-final-subq-003
-- Solved: 2026-09-15

with cte1 as (select department, full_name, salary,
    DENSE_RANK() OVER(PARTITION BY department ORDER BY salary desc) as hang
    from employees)
select department, full_name, salary
from cte1
where hang = 2
ORDER BY department asc, full_name asc
