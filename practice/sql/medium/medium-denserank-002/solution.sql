-- Xom Data · Salary bands within each department
-- Problem: https://xomdata.com/practice/medium-denserank-002
-- Solved: 2026-09-16

-- Write your SQL here
select 
    department,
    DENSE_RANK() over(PARTITION BY department ORDER BY salary desc) as salary_tier,
    full_name,
    salary
from employees
order by department asc, salary_tier asc, full_name asc
