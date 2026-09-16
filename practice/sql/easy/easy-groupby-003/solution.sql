-- Xom Data · Average score per class
-- Problem: https://xomdata.com/practice/easy-groupby-003
-- Solved: 2026-09-16

-- Write your SQL here
select class_name, round(avg(score), 2) as avg_score
from scores
GROUP BY class_name
order by class_name asc
