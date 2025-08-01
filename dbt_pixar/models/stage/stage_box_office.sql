{{
    config(
        alias='box_office', 
        schema='stage'
    ) 
}}
WITH source AS (
        SELECT * FROM {{ ref('box_office') }}
  ),
  renamed AS (
      SELECT
          *
      FROM source
  )
  SELECT * FROM renamed
