SELECT
    film AS film_name,
    TRY_CAST(budget AS INT) budget,
    box_office_us_canada,
    box_office_other,
    box_office_worldwide
FROM
    {{ ref('stage_box_office') }}
WHERE 1=1
