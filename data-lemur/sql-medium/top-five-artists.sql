/**
Another example of DENSE_RANK() - but the important part is that we DO NOT need to use
PARTITION_BY here instead just order by the a field (Read the question properly :P)
**/


WITH artist_rank_cte AS (
  SELECT 
    a.artist_name,
    DENSE_RANK() OVER (ORDER BY COUNT(s.song_id) DESC) as artist_rank
  FROM artists a 
    LEFT JOIN songs s ON a.artist_id = s.artist_id
    LEFT JOIN global_song_rank g ON s.song_id = g.song_id
  WHERE g.rank <= 10
  GROUP BY a.artist_name
)

SELECT 
  *
FROM artist_rank_cte
WHERE artist_rank <= 5
ORDER BY artist_rank ASC