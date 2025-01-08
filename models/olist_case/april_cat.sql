WITH april_cat_leads AS (
    SELECT 
        COUNT(*) AS total_cat_leads_signed_in_april
    FROM 
        {{ ref('stg_dbt_eleon__leads_closed') }}
    WHERE 
        lead_behaviour_profile = 'cat' 
        AND EXTRACT(MONTH FROM won_date) = 4
        AND won_date IS NOT NULL
)

SELECT 
    total_cat_leads_signed_in_april
FROM 
    april_cat_leads
