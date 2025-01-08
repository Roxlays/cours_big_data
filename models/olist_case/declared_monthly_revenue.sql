WITH revenue_stats AS (
    SELECT 
        MIN(declared_monthly_revenue) AS min_revenue,
        MAX(declared_monthly_revenue) AS max_revenue,
        AVG(declared_monthly_revenue) AS avg_revenue,
        COUNT(*) AS total_leads,
    FROM 
        {{ ref('stg_dbt_eleon__leads_closed') }}
)

SELECT *
FROM revenue_stats