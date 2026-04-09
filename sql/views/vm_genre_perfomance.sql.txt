CREATE OR REPLACE VIEW `netflix-pipeline-gusta.netflix_analytical.vm_genre_perfomarce`  AS
WITH exploded AS (
  SELECT
    r.rating,
    genre
  FROM `netflix-pipeline-gusta.netflix_analytical.fact_ratings` r
  JOIN `netflix-pipeline-gusta.netflix_analytical.dim_movies` m
    ON m.movie_id = r.movie_id
  CROSS JOIN UNNEST(SPLIT(COALESCE(m.genres, ''), '|')) AS genre
)
SELECT 
  genre,
  COUNT(*) AS total_ratings,
  AVG(rating) AS avg_rating,
  STDDEV(rating) AS std_rating
FROM exploded
WHERE genre IS NOT NULL
  AND genre != ''
  AND genre !='(no genres listed)'
GROUP BY 1