select id as tag_id, tag_name from {{ ref("stg_stack_overflow_tags") }}
