-- Optimized query to find the top tracks by popularity
-- This query uses an index on popularity for faster retrieval

-- Create an index on the popularity column for optimization
CREATE INDEX idx_popularity ON tracks (popularity);

SELECT 
    t.track_name,          -- Name of the track
    a.artist_name,         -- Artist of the track
    t.popularity,          -- Popularity score of the track
    t.release_date,        -- Release date of the track
    al.album_name          -- Album name the track belongs to
FROM 
    tracks t
JOIN 
    artists a ON t.artist_id = a.artist_id    -- Join to get artist information
JOIN 
    albums al ON t.album_id = al.album_id     -- Join to get album information
WHERE 
    t.popularity > 50                           -- Filter to include only tracks with popularity > 50
ORDER BY 
    t.popularity DESC                          -- Sort by popularity in descending order
LIMIT 10;                                       -- Limit the result to top 10 tracks
