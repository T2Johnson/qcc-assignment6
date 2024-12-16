--PART A1
SELECT COUNT(*) 
FROM actors 
WHERE birth_date > '1970-01-01';

--PART A2
SELECT MAX(domestic_takings) AS highest_takings, 
       MIN(domestic_takings) AS lowest_takings
FROM movie_revenues;

--PART A3
SELECT SUM(movie_length) AS total_length
FROM movies 
WHERE age_certificate = '15';

--PART A4
SELECT COUNT(*) AS japanese_directors_count
FROM directors 
WHERE nationality = 'Japanese';

--PART A5
SELECT AVG(movie_length) AS average_length
FROM movies 
WHERE movie_lang = 'Chinese';

--PART B1
SELECT nationality, COUNT(*) AS director_count
FROM directors
GROUP BY nationality;

--PART B2
SELECT age_certificate, movie_lang, SUM(movie_length) AS total_length
FROM movies
GROUP BY age_certificate, movie_lang;

--PART B3
SELECT movie_lang, SUM(movie_length) AS total_length
FROM movies
GROUP BY movie_lang
HAVING SUM(movie_length) > 500;

--PART C1
SELECT a.first_name, a.last_name
FROM actors a
JOIN movies_actors ma ON a.id = ma.actor_id  
JOIN movies m ON ma.movie_id = m.id         
JOIN directors d ON m.director_id = d.id     
WHERE d.first_name = 'Wes' AND d.last_name = 'Anderson';

--PART C2
SELECT gender, first_name, last_name, birth_date
FROM actors a
WHERE birth_date = (
    SELECT MIN(birth_date)
    FROM actors sub
    WHERE sub.gender = a.gender
)
ORDER BY gender;

--PART C3
SELECT movie_name, movie_length, age_certificate
FROM movies
WHERE movie_length > (
    SELECT AVG(movie_length)
    FROM movies AS sub
    WHERE sub.age_certificate = movies.age_certificate
);


