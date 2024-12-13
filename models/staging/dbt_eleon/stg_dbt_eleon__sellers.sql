with 

source as (

    select * from {{ source('dbt_eleon', 'sellers') }}

),

renamed as (

    select
        _line,
        _fivetran_synced,
        seller_id,
        seller_zip_code_prefix,
        seller_city,
        seller_state

    from source

)

select * from renamed
