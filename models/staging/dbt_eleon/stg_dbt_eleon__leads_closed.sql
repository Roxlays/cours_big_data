with 

source as (

    select * from {{ source('dbt_eleon', 'leads_closed') }}

),

renamed as (

    select
        _line::integer as _line,
        _fivetran_synced::timestamp as _fivetran_synced,
        mql_id::string as mql_id,
        seller_id::string as seller_id,
        sdr_id::string as sdr_id,
        sr_id::string as sr_id,
        won_date::datetime as won_date,
        business_segment::string as business_segment,
        lead_type::string as lead_type,
        lead_behaviour_profile::string as lead_behaviour_profile,
        has_company::integer as has_company,
        has_gtin::integer as has_gtin,
        average_stock::string as average_stock,
        business_type::string as business_type,
        declared_product_catalog_size::float as declared_product_catalog_size,
        declared_monthly_revenue::float as declared_monthly_revenue

    from source

)

select * from renamed
