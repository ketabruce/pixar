{{
    config(
        alias='academy', 
        schema='stage'
    ) 
}}
WITH source AS (
        SELECT * FROM {{ ref('academy') }}
  ),
  renamed AS (
      SELECT
          *
      FROM source
  )
  SELECT * FROM renamed
