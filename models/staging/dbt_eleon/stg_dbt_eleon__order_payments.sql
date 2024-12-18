with 

source as (

    select * from {{ source('dbt_eleon', 'order_payments') }}

),

renamed as (

    select
        _line::integer as _line,
        _fivetran_synced::timestamp as _fivetran_synced,
        order_id::string as order_id,
        payment_sequential::integer as payment_sequential,
        payment_type::string as payment_type,
        payment_installments::integer as payment_installments,
        payment_value::float as payment_value

    from source

)

select * from renamed
