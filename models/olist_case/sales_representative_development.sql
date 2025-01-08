WITH closed_deals_by_sdr AS (
    SELECT 
        sdr_id,
        COUNT(*) AS total_closed_deals
    FROM 
        {{ ref('stg_dbt_eleon__leads_closed') }}
    WHERE 
        sdr_id IS NOT NULL
    GROUP BY 
        sdr_id
)

SELECT 
    sdr_id,
    total_closed_deals
FROM 
    closed_deals_by_sdr
ORDER BY 
    total_closed_deals DESC