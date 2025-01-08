WITH enriched_data AS (
    SELECT 
        s.seller_city,
        oi.product_id,
        oi.price,
        oi.order_id
    FROM 
        {{ ref('stg_dbt_eleon__order_items') }} AS oi
    JOIN 
        {{ ref('stg_dbt_eleon__sellers') }} AS s
        ON oi.seller_id = s.seller_id
),

aggregated_data AS (
    SELECT 
        seller_city,
        ROUND(SUM(price), 2) AS total_turnover,
        COUNT(order_id) AS total_quantity
    FROM 
        enriched_data
    GROUP BY 
        seller_city
)

SELECT 
    seller_city,
    total_turnover,
    total_quantity
FROM 
    aggregated_data
ORDER BY 
    total_turnover DESC