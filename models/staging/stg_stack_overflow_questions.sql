select * from {{ source("stackoverflow", "posts_questions") }}
