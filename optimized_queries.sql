-- Optimized query to fetch the top 10 popular tracks for each genre
WITH ranked_tracks AS (
    SELECT
        t.track_name,
        t.popularity,
        g.genre_name,
        ROW_NUMBER() OVER (PARTITION BY g.genre_name ORDER BY t.popularity DESC) AS rank
    FROM
        tracks t
    JOIN
        genres g ON t.genre_id = g.genre_id
    WHERE
        t.popularity > 50
)
SELECT
    track_name,
    popularity,
    genre_name
FROM
    ranked_tracks
WHERE
    rank <= 10
ORDER BY
    genre_name, rank;

