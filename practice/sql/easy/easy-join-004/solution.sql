-- Xom Data · Today's showtimes in time order
-- Problem: https://xomdata.com/practice/easy-join-004
-- Solved: 2026-09-15

-- Write your SQL here
SELECT 
    start_time,
    title,
    screen
FROM showtimes s 
INNER JOIN movies m ON m.id = s.movie_id
ORDER BY start_time asc, title asc
