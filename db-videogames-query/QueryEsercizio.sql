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

--SELECT 6
SELECT *
FROM awards
WHERE description LIKE ('%facere%');

--SELECT 7 
SELECT DISTINCT videogames.name
FROM videogames
INNER JOIN category_videogame cv
ON videogames.id = cv.videogame_id
INNER JOIN categories
ON cv.category_id = categories.id
WHERE categories.id = 2 OR categories.id = 6;

--SELECT 8
SELECT *
FROM reviews
WHERE rating >=2 AND rating <= 4;

--SELECT 9
SELECT *
FROM videogames
WHERE YEAR(release_date) = 2020;

--SELECT 10
SELECT