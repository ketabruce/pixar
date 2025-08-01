SELECT DISTINCT
    value AS subgenre
FROM
    {{ ref('stage_genres') }}
WHERE 1=1
    AND category = 'Subgenre'
