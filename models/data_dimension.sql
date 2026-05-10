with cte as (

select 
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
MONTH(TO_TIMESTAMP(STARTED_AT)) AS MONTH_STARTED_AT,
CASE 
WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END AS DAY_TYPE,
{{get_season('STARTED_AT')}},
{{function1('STARTED_AT')}}
from {{ source('demo', 'bike') }}
where started_at !='started_at'

)

select * from cte
