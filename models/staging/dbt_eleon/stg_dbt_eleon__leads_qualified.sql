with 

source as (

    select * from {{ source('dbt_eleon', 'leads_qualified') }}

),

renamed as (

    select
        _line::integer as _line,
        _fivetran_synced::timestamp as _fivetran_synced,
        mql_id::string as mql_id,
        first_contact_date::date as first_contact_date,
        landing_page_id::string as landing_page_id,
        origin::string as origin

    from source

)

select * from renamed
