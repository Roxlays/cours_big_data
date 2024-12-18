with 

source as (

    select * from {{ source('dbt_eleon', 'order_reviews') }}

),

renamed as (

    select
        _line::integer as _line,
        _fivetran_synced::timestamp as _fivetran_synced,
        review_id::string as review_id,
        order_id::string as order_id,
        review_score::integer as review_score,
        review_comment_title::string as review_comment_title,
        review_comment_message::string as review_comment_message,
        review_creation_date::datetime as review_creation_date,
        review_answer_timestamp::datetime as review_answer_timestamp

    from source

)

select * from renamed
