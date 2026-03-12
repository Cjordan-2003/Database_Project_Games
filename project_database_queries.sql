SELECT *
FROM game_info NATURAL JOIN review NATURAL JOIN game_dev NATURAL JOIN game_dev_list NATURAL JOIN genre NATURAL JOIN genre_list;

/*which game falls into the most genre categories*/
SELECT title_id, title, count(genre_id)
FROM game_info NATURAL JOIN genre
GROUP BY title
ORDER BY count(genre_id) desc;

/*Which games fall into more than 5 genre categories, show the categories, and order by category count.*/
SELECT title, genre
FROM game_info  NATURAL JOIN genre_list NATURAL JOIN genre NATURAL JOIN
(
SELECT title_id, title, count(genre_id)
FROM game_info NATURAL JOIN genre
GROUP BY title
HAVING count(genre_id) > 5
ORDER BY count(genre_id) desc
) t1;

SELECT title, release_date, rating
FROM game_info
ORDER BY rating desc, title asc
LIMIT 10;

SELECT title, rating
FROM game_info
ORDER BY rating asc, title asc
LIMIT 10;

SELECT title, release_date
FROM game_info
ORDER BY release_date desc, title asc
LIMIT 10;

SELECT title, release_date
FROM game_info
ORDER BY release_date asc, title asc
LIMIT 10;

/*Which game has the most developers*/
SELECT title_id, title, count(developer_id)
FROM game_info NATURAL JOIN game_dev
GROUP BY title_id
ORDER BY count(developer_id) desc;
