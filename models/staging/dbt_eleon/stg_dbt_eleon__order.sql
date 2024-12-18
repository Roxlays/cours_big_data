with 

source as (

    select * from {{ source('dbt_eleon', 'order') }}

),

renamed as (

    select
        _line::integer as _line,
        _fivetran_synced::timestamp as _fivetran_synced,
        order_id::string as order_id,
        customer_id::string as customer_id,
        order_status::string as order_status,
        order_purchase_timestamp::datetime as order_purchase_timestamp,
        order_approved_at::datetime as order_approved_at,
        order_delivered_carrier_date::datetime as order_delivered_carrier_date,
        order_delivered_customer_date::datetime as order_delivered_customer_date,
        order_estimated_delivery_date::datetime as order_estimated_delivery_date
        
    from source

)

select * from renamed
