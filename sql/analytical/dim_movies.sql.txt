-- ==================================================================================
-- =============================1 DIM TABLE: dim_movies==============================
-- ==================================================================================

CREATE OR REPLACE TABLE  `netflix-pipeline-gusta.netflix_analytical.dim_movies` AS
SELECT
  SAFE_CAST(movieId AS INT64) AS movie_id,
  title,
  genres,
  SAFE_CAST(REGEXP_EXTRACT(title, r'\((\d{4})\)') AS INT64) AS release_year
FROM `netflix-pipeline-gusta.netflix_raw.raw_movies`;