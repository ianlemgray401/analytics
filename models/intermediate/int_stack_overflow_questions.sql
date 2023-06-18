select
    id as question_id
    , title
    , body
    , accepted_answer_id
    , answer_count
    , comment_count
    , creation_date as created_at
    , favorite_count
    , last_activity_date as last_activity_at
    , owner_user_id
    , score
    , tags
    , view_count
from {{ ref("stg_stack_overflow_questions") }}
