with
    avg_answer_score as (
        select parent_id as question_id, avg(score) as avg_answer_score
        from {{ ref("int_stack_overflow_answers") }}
        group by 1
    )

select
    q.question_id,
    q.title as question_title,
    q.body as question_body,
    q.answer_count,
    q.comment_count as question_comment_count,
    q.created_at as question_created_at,
    q.owner_user_id as question_user_id,
    q.score as question_score,
    q.tags as question_tags,
    q.view_count as question_view_count,
    a.title as answer_title,
    a.body as answer_body,
    a.comment_count as answer_comment_count,
    a.created_at as answer_created_at,
    a.owner_user_id as answer_user_id,
    a.score as answer_score,
    a.tags as answer_tags,
    a.view_count as answer_view_count,
    s.avg_answer_score
from {{ ref("int_stack_overflow_questions") }} q
left join
    {{ ref("int_stack_overflow_answers") }} a on q.accepted_answer_id = a.answer_id
left join avg_answer_score s on s.question_id = q.question_id
