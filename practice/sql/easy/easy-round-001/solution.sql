-- Xom Data · Display rates for the app
-- Problem: https://xomdata.com/practice/easy-round-001
-- Solved: 2026-09-16

-- Write your SQL here
select currency_pair, ROUND(raw_rate, 2) as display_rate
from fx_rates
