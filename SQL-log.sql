-- This is a partial log from the SQL lesson
-- Please see the lesson for more: https://datacarpentry.org/sql-ecology-lesson/00-sql-introduction/index.html

-- Challenge: Using the surveys table write a query to display the three date fields,
-- species_id, and weight in kilograms (rounded to two decimal places), for individuals
-- captured in 1999, ordered alphabetically by the species_id.
SELECT year, month, day, species_id, ROUND (weight/1000 ,2) AS weight_kg
FROM surveys
WHERE year = 1999
ORDER BY species_id ASC;


-- Aggregation
SELECT COUNT(*)
FROM surveys;

--COUNT of a specific field
SELECT COUNT(weight)
FROM surveys;

--FILTER for NULL
SELECT COUNT(*)
FROM surveys
WHERE weight IS NULL;

SELECT COUNT(weight)
FROM surveys
WHERE weight IS NULL;

--GROUP BY
SELECT species_id, COUNT(*)
FROM surveys
GROUP BY species_id;

--filtering by aggegrate data
--use HAVING instead of WHERE for aggregate functions
SELECT species_id, COUNT(*)
FROM surveys
GROUP BY species_id
HAVING COUNT(*) > 50;

-- ORDER BY aggregate:
SELECT species_id, COUNT(*)
FROM surveys
GROUP BY species_id
HAVING COUNT(*) > 50
ORDER BY COUNT(*);

-- NULL in negative queryies
SELECT COUNT(*)
FROM surveys
WHERE sex != 'M';

SELECT sex, COUNT(*)
FROM surveys
GROUP BY sex;

-- include NULL values in negative query
SELECT COUNT(*)
FROM surveys
WHERE sex != 'M' OR sex IS NULL;

SELECT COUNT(*)
FROM surveys
WHERE sex != 'M' OR sex IS NULL;

-- JOINS (doing inner join), NULLs are ommitted
SELECT *
FROM surveys
JOIN species
ON surveys.species_id = species.species_id;

SELECT COUNT(*)
FROM surveys
WHERE species_id IS NULL;

-- LEFT JOIN
SELECT *
FROM surveys
LEFT JOIN species
ON surveys.species_id = species.species_id;

-- choose specific fileds  in a join
SELECT surveys.year, surveys.month, species.taxa
FROM surveys
LEFT JOIN species
ON surveys.species_id = species.species_id; 

