SELECT
    ROUND(AVG(total_basket_value), 2) AS average_basket_value
FROM 
    {{ ref ('basket_data_sum')}}

