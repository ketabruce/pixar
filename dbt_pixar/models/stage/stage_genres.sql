{{
    config(
        alias='genres', 
        schema='stage'
    ) 
}}
WITH source AS (
        SELECT * FROM {{ ref('genres') }}
  ),
  renamed AS (
      SELECT
          *
      FROM source
  )
  SELECT * FROM renamed
