CREATE OR REPLACE VIEW `netflix-pipeline-gusta.netflix_analytical.vm_scatter_popularity_vs_quality` AS
SELECT 
  movie_id,
  title,
  genres,
  release_year,
  total_ratings,
  avg_rating
FROM `netflix-pipeline-gusta.netflix_analytical.vm_movies_kpi`
WHERE total_ratings >= 50