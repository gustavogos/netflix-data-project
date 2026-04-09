-- ==================================================================================
-- ===============2 FACT TABLE: fact_ratings (unir os 2 CSVs de ratings) ============
-- ==================================================================================

CREATE OR REPLACE TABLE `netflix-pipeline-gusta.netflix_analytical.fact_ratings` AS 
WITH all_ratings AS (

-- Fonte 1: user_rating_history
SELECT
  SAFE_CAST(NULLIF(userId,'') AS INT64) AS user_id,
  SAFE_CAST(NULLIF(movieId,'') AS INT64) AS movie_id,

---------- Remove NA/Null ----------------
  SAFE_CAST(NULLIF(NULLIF(rating, 'NA'),'') AS FLOAT64) AS rating,

    TIMESTAMP_SECONDS(
    SAFE_CAST(NULLIF(tstamp,'') AS INT64)
  ) AS event_timestamp,

  'history' AS source
FROM `netflix-pipeline-gusta.netflix_raw.raw_user_rating_history`

UNION ALL 

----- fonte 2: rating_for_addiotional_users
SELECT
  SAFE_CAST(NULLIF(userId,'') AS INT64) AS user_id,
  SAFE_CAST(NULLIF(movieId,'') AS INT64) AS movie_id,

  SAFE_CAST(NULLIF(NULLIF(rating, 'NA'),'') AS FLOAT64) AS rating,

  TIMESTAMP(NULLIF(tstamp,'')) AS event_timestamp,

  'additional' AS source

FROM `netflix-pipeline-gusta.netflix_raw.raw_ratings_for_additional_users`

)
SELECT *
FROM all_ratings
WHERE user_id IS NOT NULL
  AND movie_id IS NOT NULL
  AND rating IS NOT NULL
  AND ratingi IS NOT NULL