with 

source as (

    select * from {{ source('dbt_eleon', 'sellers') }}

),

renamed as (

    select
        _line::integer as _line,
        _fivetran_synced::timestamp as _fivetran_synced,
        seller_id::string as seller_id,
        seller_zip_code_prefix::integer as seller_zip_code_prefix,
        seller_city::string as seller_city,
        seller_state::string as seller_state

    from source

)

select * from renamed
