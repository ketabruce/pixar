SELECT
    subgenre.subgenre,
    SUM(CAST(income.budget AS BIGINT)) AS budget,
    SUM(CAST(income.box_office_us_canada AS BIGINT)) AS box_office_us_canada,
    SUM(CAST(income.box_office_other AS BIGINT)) AS box_office_other,
    SUM(CAST(income.box_office_worldwide AS BIGINT)) AS box_office_worldwide
FROM
    {{ ref('dim_films') }} films
    LEFT JOIN {{ ref('fact_income') }} income
        ON films.film_name = income.film_name
    LEFT JOIN {{ ref('fact_film_subgenre') }} subgenre
        ON films.film_name = subgenre.film_name
WHERE 1=1
GROUP BY subgenre.subgenre
