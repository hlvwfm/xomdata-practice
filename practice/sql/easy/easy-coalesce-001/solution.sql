-- Xom Data · Display names on profile pages
-- Problem: https://xomdata.com/practice/easy-coalesce-001
-- Solved: 2026-09-16

-- Write your SQL here
select real_name, nickname,
    case 
        when nickname IS NOT NULL then nickname
        else real_name
    end as display_name
from profiles
