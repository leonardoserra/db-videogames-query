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
SELECT DISTINCT videogames.id, videogames.name
FROM videogames
INNER JOIN reviews
ON videogames.id = reviews.videogame_id
WHERE reviews.rating = 5;

--SELECT Bonus 11
SELECT COUNT(reviews.id) as numero_di_recensioni, AVG(reviews.rating) as media_recensioni
FROM videogames
INNER JOIN reviews
ON videogames.id = reviews.videogame_id
WHERE videogames.id = 412;

--SELECT Bonus 12
SELECT COUNT(videogames.id) as numero_di_videogames_rilasciati
FROM videogames
INNER JOIN software_houses
ON videogames.software_house_id = software_houses.id
WHERE software_house_id = 1 AND YEAR(videogames.release_date) = 2018;


-----------------------------------------------

--GROUP BY 1
SELECT COUNT(*) as numero_sh_in_country, software_houses.country
FROM software_houses
GROUP BY country;

--GROUP BY 2
SELECT videogame_id, COUNT(*)
FROM reviews
GROUP BY videogame_id; 

--GROUP BY 3
SELECT pegi_labels.id as pegi_label, COUNT(*) as videogames_per_pegi_label
FROM pegi_labels
INNER JOIN pegi_label_videogame
ON pegi_labels.id = pegi_label_videogame.pegi_label_id
INNER JOIN videogames
ON pegi_label_videogame.videogame_id = videogames.id
GROUP BY pegi_labels.id;

--GROUP BY 4
SELECT COUNT(videogames.id)
FROM videogames
GROUP BY YEAR(videogames.release_date);



--GROUP BY 5



--GROUP BY 6