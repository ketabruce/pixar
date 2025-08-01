SELECT DISTINCT
    film AS film_name,
    value AS genre
FROM
    {{ ref('stage_genres') }}
WHERE 1=1
    AND category = 'Genre'
