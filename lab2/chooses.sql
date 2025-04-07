SELECT first_name, second_name FROM players;

SELECT * FROM stadiums WHERE (capacity > 70000);

SELECT sname, city FROM stadiums ORDER BY capacity;
SELECT sname, city FROM staidums ORDER BY capacity DESC;

SELECT concat(second_name, ' ', first_name) AS naming FROM players WHERE (club_id = 1);

SELECT club_id, max(birthday) FROM players GROUP BY club_id;

SELECT DISTINCT pnumber FROM players ORDER BY pnumber;