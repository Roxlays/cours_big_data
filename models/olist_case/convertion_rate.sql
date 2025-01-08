WITH lead_counts AS (
    SELECT 
        COUNT(DISTINCT q.mql_id) AS total_qualified_leads,
        COUNT(DISTINCT c.mql_id) AS total_closed_deals
    FROM 
        {{ ref('stg_dbt_eleon__leads_qualified') }} AS q
    LEFT JOIN 
        {{ ref('stg_dbt_eleon__leads_closed') }} AS c
        ON q.mql_id = c.mql_id
)

SELECT 
    total_qualified_leads,
    total_closed_deals,
    ROUND((total_closed_deals * 100.0) / total_qualified_leads, 2) AS conversion_rate_percentage
FROM 
    lead_counts
