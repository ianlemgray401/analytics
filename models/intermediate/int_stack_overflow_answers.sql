select
    id as answer_id
    , title
    , body
    , comment_count
    , creation_date as created_at
    , favourite_count
    , owner_user_id
    , score
    , tags
    , view_count
from {{ ref("stg_stack_overflow_answers") }}