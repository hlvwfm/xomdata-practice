-- Xom Data · Devices ready for dispatch
-- Problem: https://xomdata.com/practice/easy-not-001
-- Solved: 2026-09-16

-- Write your SQL here
SELECT device_code, status
from devices
where status not like 'Maintenance'
