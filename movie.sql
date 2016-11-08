/* Select all columns and rows from the movies table */
SELECT * FROM movies;
/* Select only the title and id of the first 10 rows */
SELECT title, movieid
FROM movies
WHERE movieid <= 10;
/* Find the movie with the id of 485 */
SELECT title, movieid
FROM movies
WHERE movieid = '485';
/* Find the id (only that column) of the movie Made in America (1993) */
SELECT DISTINCT 'Made In America (1993)', movieid From movies;
/* Find the first 10 sorted alphabetically */
SELECT title, movieid
FROM movies
WHERE movieid <= 10
ORDER BY title ASC;
/* Find all movies from 2002 */
SELECT title, movieid
FROM movies
WHERE title LIKE '%(2002)%';
/* Find out what year the Godfather came out */
SELECT title
FROM movies
WHERE title LIKE '%Godfather%';
/* Without using joins find all the comedies */
SELECT title, genres
FROM movies
WHERE genres LIKE '%Comedy%';
/* Find all comedies in the year 2000 */
SELECT title, genres
FROM movies
WHERE genres LIKE '%Comedy%'
AND
title LIKE '%(2002)%';
/* Find any movies that are about death and are a comedy */
SELECT title, genres
FROM movies
WHERE genres LIKE '%Comedy%'
AND
title LIKE '%Death%';
/* Find any movies from either 2001 or 2002 with a title containing super */
SELECT title
FROM movies
WHERE (title LIKE '%(2001)%' OR title LIKE '%(2002)%') AND title LIKE '%Super%';
--Joins--
/* Find all the ratings for the movie Godfather, show just the title and the rating */
SELECT title, rating
FROM movies
JOIN ratings ON movies.movieid = ratings.movieid
WHERE movies.title LIKE 'Godfather, The%';

/* Order the previous objective by newest to oldest */
SELECT title, rating
FROM movies
JOIN ratings ON movies.movieid = ratings.movieid
WHERE movies.title LIKE 'Godfather, The%'
ORDER BY rating ASC;

/* Find the comedies from 2005 and get the title and imdbid from the links table */
SELECT title, genres, links.imdbid
FROM movies
JOIN links ON movies.movieid = links.movieid
WHERE title LIKE '%(2005)%' AND genres LIKE '%Comedy%';

/* Find all movies that have no ratings */
SELECT title, movies.movieid, ratings.movieid, rating
FROM movies
LEFT JOIN ratings ON movies.movieid = ratings.movieid
WHERE rating ISNULL;

