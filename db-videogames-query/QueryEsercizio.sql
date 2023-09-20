--SELECT 1
SELECT *
FROM software_houses
WHERE country = 'United States';

--SELECT 2
SELECT *
FROM players
WHERE city = 'Rogahnland';

--SELECT 3
SELECT *
FROM players
WHERE name LIKE('%a');

--SELECT 4
SELECT * 
FROM players
INNER JOIN reviews 
ON players.id = reviews.player_id 
WHERE player_id = 800;

--SELECT 5
SELECT COUNT(*) as tournaments_in_2015 
FROM tournaments
WHERE tournaments.year = 2015;
