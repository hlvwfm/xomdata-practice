-- Xom Data · Employees paid above their department average
-- Problem: https://xomdata.com/practice/medium-subquery-110
-- Solved: 2026-09-15

with cte1 as (
    select
        full_name, 
        dept_name,
        salary,
        AVG(salary) OVER(PARTITION BY e.department_id) as dept_avg_salary
    from employees e
    INNER JOIN departments d ON d.id = e.department_id

)
select 
    full_name,
    dept_name,
    salary,
    ROUND(dept_avg_salary,0) as dept_avg_salary,
    ROUND((salary -dept_avg_salary)*100.0/dept_avg_salary, 2) as premium_pct
from cte1
where salary > dept_avg_salary
ORDER BY premium_pct desc, dept_name asc, full_name asc
