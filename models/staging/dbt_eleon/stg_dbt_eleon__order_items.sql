with 

source as (

    select * from {{ source('dbt_eleon', 'order_items') }}

),

renamed as (

    select
        _line::integer as _line,
        _fivetran_synced::timestamp as _fivetran_synced,
        order_id::string as order_id,
        order_item_id::integer as order_item_id,
        product_id::string as product_id,
        seller_id::string as seller_id,
        shipping_limit_date::datetime as shipping_limit_date,
        price::float as price,
        freight_value::float as freight_value

    from source

)

select * from renamed
