with 

source as (

    select * from {{ source('dbt_eleon', 'geolocation') }}

),

renamed as (

    select
        _line::integer as _line,
        _fivetran_synced::timestamp as _fivetran_synced,
        geolocation_zip_code_prefix::integer as geolocation_zip_code_prefix,
        geolocation_lat::float as geolocation_lat,
        geolocation_lng::float as geolocation_lng,
        geolocation_city::string as geolocation_city,
        geolocation_state::string as geolocation_state

    from source

)

select * from renamed
