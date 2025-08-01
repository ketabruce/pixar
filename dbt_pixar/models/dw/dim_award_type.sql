SELECT DISTINCT
    award_type
FROM
    {{ ref('stage_academy') }}
