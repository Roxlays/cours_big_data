with 

source as (

    select * from {{ source('dbt_eleon', 'products') }}

),

categories as (
    
    select * from {{ source('dbt_eleon', 'product_categories') }}
),

renamed as (
    select
        p._line::integer as _line,
        p._fivetran_synced::timestamp as _fivetran_synced,
        p.product_id::string as product_id,
        coalesce(c.product_category_name_english, p.product_category_name)::string as product_category_name,
        p.product_name_lenght::float as product_name_lenght,
        p.product_description_lenght::float as product_description_lenght,
        p.product_photos_qty::float as product_photos_qty,
        p.product_weight_g::float as product_weight_g,
        p.product_length_cm::float as product_length_cm,
        p.product_height_cm::float as product_height_cm,
        p.product_width_cm::float as product_width_cm
    from source p
    left join categories c
    on p.product_category_name = c.product_category_name

)

select * from renamed
