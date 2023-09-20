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
SELECT devices.id as nome_device, COUNT(*) as numero_videogames
FROM devices
INNER JOIN device_videogame
ON devices.id = device_videogame.device_id
INNER JOIN videogames
ON device_videogame.videogame_id = videogames.id 
GROUP BY devices.id;

--GROUP BY 6
SELECT AVG(rating)
FROM reviews
GROUP BY videogame_id

------------------------------------------------------

--JOIN 1
SELECT DISTINCT players.id, players.name, players.lastname
FROM players
INNER JOIN reviews
ON players.id = reviews.player_id;

--JOIN 2
SELECT DISTINCT videogames.id, videogames.name
FROM videogames
INNER JOIN tournament_videogame
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN tournaments
ON tournament_videogame.tournament_id = tournaments.id
WHERE tournaments.year = 2016;

--JOIN 3
SELECT *
FROM videogames
INNER JOIN category_videogame
ON videogames.id = category_videogame.videogame_id
INNER JOIN categories
ON category_videogame.category_id = categories.id;

--JOIN 4
SELECT DISTINCT software_houses.name, software_houses.city, software_houses.country
FROM software_houses
INNER JOIN videogames
ON software_houses.id = videogames.software_house_id
WHERE YEAR(videogames.release_date) >= 2020;

--JOIN 5
SELECT *
FROM awards
INNER JOIN award_videogame
ON awards.id = award_videogame.award_id
INNER JOIN videogames
ON award_videogame.videogame_id = videogames.id
INNER JOIN software_houses
ON videogames.software_house_id = software_houses.id

--JOIN 6
SELECT DISTINCT videogames.name as videogame_name, categories.name as category, pegi_labels.name as pegi_label 
FROM videogames
INNER JOIN category_videogame
ON videogames.id = category_videogame.videogame_id
INNER JOIN categories
ON category_videogame.category_id = categories.id
INNER JOIN pegi_label_videogame
ON videogames.id = pegi_label_videogame.videogame_id
INNER JOIN pegi_labels
ON pegi_label_videogame.pegi_label_id = pegi_labels.id
INNER JOIN reviews
ON videogames.id = reviews.videogame_id
WHERE rating = 4 OR rating = 5;

--JOIN 7
SELECT DISTINCT videogames.id, videogames.name as vg_name
FROM videogames
INNER JOIN tournament_videogame
ON videogames.id = tournament_videogame.videogame_id
INNER JOIN tournaments
ON tournament_videogame.tournament_id = tournaments.id
INNER JOIN player_tournament
ON tournaments.id = player_tournament.tournament_id
INNER JOIN players
ON player_tournament.player_id = players.id
WHERE players.name LIKE('S%');

--JOIN 8
SELECT tournaments.city as city
FROM tournaments
INNER JOIN tournament_videogame
ON tournaments.id = tournament_videogame.tournament_id
INNER JOIN videogames
ON tournament_videogame.videogame_id = videogames.id
INNER JOIN award_videogame
ON videogames.id = award_videogame.videogame_id
INNER JOIN awards
ON award_videogame.award_id = awards.id
WHERE award_videogame.year = 2018;














