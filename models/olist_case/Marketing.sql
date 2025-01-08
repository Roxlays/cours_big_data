WITH marketing AS (
    SELECT 
        q.*,
        c.*
    FROM 
        {{ ref('stg_dbt_eleon__leads_qualified') }} AS q
    LEFT JOIN 
        {{ ref('stg_dbt_eleon__leads_closed') }} AS c
        ON q.mql_id = c.mql_id
)

SELECT 
    *
FROM 
    marketing
