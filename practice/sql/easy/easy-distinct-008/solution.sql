-- Xom Data · Countries our students come from
-- Problem: https://xomdata.com/practice/easy-distinct-008
-- Solved: 2026-09-16

-- Write your SQL here
select count(distinct(country)) as nuM_countries
from students
where student_name IS NOT NULL
