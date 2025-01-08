SELECT 
    o.order_id,
    SUM(oi.price) AS total_basket_value
FROM 
    {{ ref('stg_dbt_eleon__orders') }} AS o
JOIN 
    {{ ref('stg_dbt_eleon__order_items') }} AS oi
    ON o.order_id = oi.order_id
GROUP BY 
    o.order_id