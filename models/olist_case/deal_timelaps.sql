WITH deal_dates AS (
    SELECT 
        MIN(c.won_date) AS first_deal_closed,
        MAX(c.won_date) AS last_deal_closed
    FROM 
        {{ ref('stg_dbt_eleon__leads_closed') }} AS c
)

SELECT 
    first_deal_closed,
    last_deal_closed,
    DATE_DIFF(last_deal_closed, first_deal_closed, DAY) AS dataset_timelapse_days
FROM 
    deal_dates
