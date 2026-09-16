-- Xom Data · Ticket statuses guests can read
-- Problem: https://xomdata.com/practice/easy-join-005
-- Solved: 2026-09-15

-- Write your SQL here
SELECT 
    ticket_code,
    status_name
FROM tickets t 
INNER JOIN statuses s ON s.code = t.status_code
