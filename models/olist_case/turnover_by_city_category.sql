WITH enriched_data AS (
    SELECT 
        oi.order_id,
        c.customer_city,
        p.product_category_name,
        oi.price,
        o.customer_id
    FROM 
        {{ ref('stg_dbt_eleon__order_items') }} AS oi
    JOIN 
        {{ ref('stg_dbt_eleon__products') }} AS p
        ON oi.product_id = p.product_id
    JOIN 
        {{ ref('stg_dbt_eleon__orders') }} AS o
        ON oi.order_id = o.order_id
    JOIN 
        {{ ref('stg_dbt_eleon__customers') }} AS c
        ON o.customer_id = c.customer_id
),

aggregated_data AS (
    SELECT 
        customer_city,
        product_category_name,
        SUM(price) AS total_turnover,
        COUNT(DISTINCT order_id) AS total_orders,
        COUNT(DISTINCT customer_id) AS total_customers
    FROM 
        enriched_data
    GROUP BY 
        customer_city, product_category_name
)

SELECT 
    customer_city,
    product_category_name,
    total_turnover,
    total_orders,
    total_customers
FROM 
    aggregated_data
ORDER BY 
    customer_city, total_turnover DESC
