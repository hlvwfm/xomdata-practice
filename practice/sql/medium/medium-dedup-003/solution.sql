-- Xom Data · Latest readings and over-limit alerts
-- Problem: https://xomdata.com/practice/medium-dedup-003
-- Solved: 2026-09-16

-- Write your SQL here
with cte1 as (
    select
        sensor_name,
        reading_date,
        temp_c,
        max_temp,
        ROW_NUMBER() over(PARTITION BY sensor_id ORDER BY reading_date desc) as stt
    from sensors s
    inner join readings r on r.sensor_id = s.id

)
select  
    sensor_name,
        reading_date,
        temp_c,
        max_temp,
        case when temp_c > max_temp then 'Alert' else 'Normal' end as status
from cte1
where stt = 1
order by sensor_name asc
