with 

source as (

    select * from {{ source('dbt_eleon', 'order') }}

),

renamed as (

    select

    from source

)

select * from renamed
