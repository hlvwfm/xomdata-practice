-- Xom Data · Top-scoring players
-- Problem: https://xomdata.com/practice/easy-where-027
-- Solved: 2026-09-15

select full_name, goals_scored
FROM players
where goals_scored > 10
ORDER BY goals_scored desc
