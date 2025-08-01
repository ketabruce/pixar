{{
    config(
        alias='films', 
        schema='stage'
    ) 
}}
WITH source AS (
        SELECT * FROM {{ ref('pixar_films') }}
  ),
  renamed AS (
      SELECT
          *
      FROM source
  )
  SELECT * FROM renamed
