WITH closed_deals_by_segment AS (
    SELECT 
        business_segment,
        COUNT(*) AS total_closed_deals
    FROM 
        {{ ref('stg_dbt_eleon__leads_closed') }}
    WHERE 
        business_segment IS NOT NULL
    GROUP BY 
        business_segment
)

SELECT 
    business_segment,
    total_closed_deals
FROM 
    closed_deals_by_segment
ORDER BY 
    total_closed_deals DESC
