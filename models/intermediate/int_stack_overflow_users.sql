select
    id as user_id,
    display_name,
    age,
    creation_date as created_at,
    last_access_date as last_accessed_at,
    location,
    reputation,
    up_votes,
    down_votes,
    views
from {{ ref("stg_stack_overflow_users") }}
