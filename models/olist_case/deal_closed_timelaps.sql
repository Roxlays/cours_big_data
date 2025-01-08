WITH enriched_leads_closed AS (
    SELECT 
        lc.*,
        lq.first_contact_date
    FROM 
        {{ ref('stg_dbt_eleon__leads_closed') }} AS lc
    LEFT JOIN 
        {{ ref('stg_dbt_eleon__leads_qualified') }} AS lq
        ON lc.mql_id = lq.mql_id
),
timelapse_analysis AS (
    SELECT 
        DATE_DIFF(won_date, first_contact_date, DAY) AS timelapse_in_days,
        COUNT(*) AS total_closed_deals
    FROM 
        enriched_leads_closed
    WHERE 
        first_contact_date IS NOT NULL
        AND won_date IS NOT NULL
    GROUP BY 
        timelapse_in_days
)

SELECT 
    timelapse_in_days,
    total_closed_deals
FROM 
    timelapse_analysis
ORDER BY 
    timelapse_in_days