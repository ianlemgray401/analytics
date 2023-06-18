with
    temp_tags as (
        select *
        from {{ ref("int_stack_overflow_tags") }} t
        left join
            {{ ref("int_stack_overflow_questions") }} q
            on lower(t.tag_name) like lower(q.tags)
    )

select
    tag_id,
    tag_name,
    date_trunc(date(q.created_at), month) as m,
    count(distinct question_id) as total_questions,
    count(
        distinct case when accepted_answer_id is not null then question_id end
    ) as total_accepted_answers,
    sum(view_count) as total_view_count,
    avg(score) as avg_score
from temp_tags
group by 1, 2, 3
