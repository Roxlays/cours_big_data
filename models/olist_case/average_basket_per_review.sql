WITH reviewed_baskets AS (
    SELECT 
        b.total_basket_value
    FROM 
        {{ ref('basket_data_sum') }} AS b
    JOIN 
        {{ ref('stg_dbt_eleon__order_reviews') }} AS r
        ON b.order_id = r.order_id
)

SELECT 
    ROUND(AVG(total_basket_value), 2) AS average_basket_per_review
FROM 
    reviewed_baskets
