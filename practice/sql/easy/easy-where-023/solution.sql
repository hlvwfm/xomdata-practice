-- Xom Data · Multi-day tours
-- Problem: https://xomdata.com/practice/easy-where-023
-- Solved: 2026-09-15

select tour_name, days, adult_price from tours
where days >=4 
ORDER BY tour_name asc
