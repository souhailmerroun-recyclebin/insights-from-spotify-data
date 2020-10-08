/* Most played song ever in a given day */
SELECT endTime, artistName, trackName, ROUND(msPlayed / 60000, 0) as minutes FROM streamingHistory ORDER BY msPlayed DESC

/* Number of plays and duration of plays per artist */
SELECT 
	COUNT(artistName) as numberOfPlays, 
	ROUND(SUM(msPlayed / 60000), 0) as durationOfPlays,
	artistName 
FROM 
	streamingHistory 
GROUP BY 
	artistName 
ORDER BY 
	durationOfPlays DESC

/* Most plays on a song */
SELECT COUNT(trackName) as numberOfPlays, ROUND(SUM(msPlayed / 60000), 0) as durationOfPlays, trackName FROM streamingHistory GROUP BY trackName ORDER BY durationOfPlays DESC

/* Total plays per day / Longest plays days */
SELECT 
	DATE(endTime) as day, 
	SUM(ROUND(msPlayed / 60000, 0)) as totalMinutes
FROM 
	streamingHistory 
GROUP BY 
	day 
ORDER BY 
	totalMinutes DESC