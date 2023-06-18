select
    id as answer_id
    , title
    , body
    , comment_count
    , creation_date as created_at
    , favorite_count
    , owner_user_id
    , parent_id as parent_question_id
    , score
    , tags
    , view_count
from {{ ref("stg_stack_overflow_answers") }}