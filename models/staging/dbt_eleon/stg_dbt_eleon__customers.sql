with 

source as (

    select * from {{ source('dbt_eleon', 'customers') }}

),

renamed as (

    select
        _line::integer as _line,
        _fivetran_synced::timestamp as _fivetran_synced,
        customer_id::string as customer_id,
        customer_unique_id::string as customer_unique_id,
        customer_zip_code_prefix::integer as customer_zip_code_prefix,
        customer_city::string as customer_city,
        customer_state::string as customer_state

    from source

)

select * from renamed
