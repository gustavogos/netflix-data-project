CREATE OR REPLACE VIEW `netflix-pipeline-gusta.netflix_analytical.vm_movies_kpi` AS
SELECT
  f.movie_id,
  d.title,
  d.genres,
  d.release_year,

  COUNT(*) AS total_ratings,
  COUNT(DISTINCT f.user_id) AS total_users,

  AVG(f.rating) AS avg_rating,
  STDDEV(f.rating) AS std_rating,

  MIN(f.rating_ts) AS first_rating_ts,
  MAX(f.rating_ts) AS last_rating_ts

FROM `netflix-pipeline-gusta.netflix_analytical.fact_ratings` f

LEFT JOIN `netflix-pipeline-gusta.netflix_analytical.dim_movies` d
  ON f.movie_id = d.movie_id


GROUP BY
  f.movie_id,
  d.title,
  d.genres,
  d.release_year