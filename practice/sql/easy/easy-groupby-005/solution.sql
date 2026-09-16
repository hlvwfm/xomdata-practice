-- Xom Data · Top salary in each department
-- Problem: https://xomdata.com/practice/easy-groupby-005
-- Solved: 2026-09-16

-- Write your SQL here
select department, max(salary) as top_salary
from employees
GROUP BY department
ORDER BY department asc
