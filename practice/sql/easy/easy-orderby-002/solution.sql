-- Xom Data · Room price list by tier
-- Problem: https://xomdata.com/practice/easy-orderby-002
-- Solved: 2026-09-16

-- Write your SQL here
SELECT room_no, room_type, price
from rooms
order by room_type asc, price asc, room_no asc
