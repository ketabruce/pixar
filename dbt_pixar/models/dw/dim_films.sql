SELECT DISTINCT
    number AS film_id,
    film AS film_name,
    release_date,
    run_time,
    film_rating,
    plot
FROM
    {{ ref('stage_films') }}
WHERE 1=1
