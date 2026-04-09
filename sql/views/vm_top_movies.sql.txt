CREATE OR REPLACE VIEW `netflix-pipeline-gusta.netflix_analytical.vm_top_movies` AS
SELECT 
  movie_id,
  title,
  genres,
  release_year,
  total_ratings,
  ROUND(avg_rating, 2) AS avg_rating
FROM `netflix-pipeline-gusta.netflix_analytical.vm_movies_kpi`
WHERE total_ratings >= 20
AND avg_rating BETWEEN 0 AND 5
ORDER BY avg_rating DESC, total_ratings DESC
LIMIT 10