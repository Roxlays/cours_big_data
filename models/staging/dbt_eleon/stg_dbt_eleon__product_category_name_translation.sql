with 

source as (

    select * from {{ source('dbt_eleon', 'product_category_name_translation') }}

),

renamed as (

    select
        _line::integer as _line,
        _fivetran_synced::timestamp as _fivetran_synced,
        product_category_name::string as product_category_name,
        product_category_name_english::string as product_category_name_english

    from source

)

select * from renamed
