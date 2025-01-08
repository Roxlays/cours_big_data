WITH deals_on_saturdays AS (
    SELECT 
        COUNT(won_date) AS total_saturday_deals
    FROM 
        {{ ref('stg_dbt_eleon__leads_closed') }} AS c
    WHERE 
        EXTRACT(DAYOFWEEK FROM c.won_date) = 7
)

SELECT 
    total_saturday_deals
FROM 
    deals_on_saturdays
