WITH enriched_reviews AS (
    SELECT 
        r.review_id,
        o.order_id,
        o.order_estimated_delivery_date,
        o.order_delivered_customer_date,
        o.order_purchase_timestamp,
        DATE_DIFF(o.order_delivered_customer_date, o.order_estimated_delivery_date, DAY) AS timelapse_estimated_vs_actual,
        DATE_DIFF(o.order_delivered_customer_date, o.order_purchase_timestamp, DAY) AS timelapse_purchase_vs_actual
    FROM 
        {{ ref('stg_dbt_eleon__order_reviews') }} AS r
    JOIN 
        {{ ref('stg_dbt_eleon__orders') }} AS o
        ON r.order_id = o.order_id
    WHERE 
        o.order_delivered_customer_date IS NOT NULL
)

SELECT 
    review_id,
    order_id,
    timelapse_estimated_vs_actual,
    timelapse_purchase_vs_actual
FROM 
    enriched_reviews