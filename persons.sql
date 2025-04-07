CREATE TABLE persons(
    id serial PRIMARY KEY,
    last_name varchar(64) NOT NULL,
    first_name varchar(64) NOT NULL,
    second_name varchar(64),
    sex varchar CHECK(sex IN ('M', 'F')) NOT NULL,
    birthday date NOT NULL,
    UNIQUE(last_name, first_name, second_name, birthday)
);

INSERT INTO persons(
    last_name, first_name, second_name, sex, birthday
) VALUES(
    'Kasimov', 'Roman', 'Elmirovich', 'M', '2004-09-25'
);

SELECT first_name, last_name, second_name FROM persons;

SELECT last_name || ' ' ||
    SUBSTRING(first_name from 1 for 1) || '.' ||
    SUBSTRING(second_name from 1 for 1) || '.'
        as "Фамилия с инициалами"
FROM persons;

SELECT NOW() as "Local time", 1+1 as "Result", last_name FROM persons;

SELECT DISTINCT last_name FROM persons;

SET DateStyle TO German;
SELECT * FROM persons;

ALTER TABLE persons ADD salary numeric(8, 2);

UPDATE persons SET salary = '155000' WHERE first_name = 'Ivan';

SELECT last_name, first_name, second_name FROM persons WHERE salary < 150000;
SELECT last_name, first_name, second_name FROM persons WHERE salary BETWEEN 100000 AND 200000;
SELECT last_name, first_name, second_name FROM persons WHERE sex = 'M';
SELECT last_name, first_name, second_name FROM persons WHERE salary > 100000 AND sex = 'M'

INSERT INTO persons(
    last_name, first_name, second_name, sex, birthday, salary
) VALUES(
    'Samoylenko', 'Darya', 'Olegovna', 'F', '2003-12-09', '25790'
);


SELECT last_name, first_name, second_name FROM persons WHERE second_name LIKE 'E%ich';

SELECT upper(last_name), lower(first_name), initcap(second_name) FROM persons WHERE to_char(birthday, 'DD.MM.YYYY') LIKE '%04';

SELECT * FROM persons ORDER BY salary DESC;

SELECT * FROM persons WHERE salary > 100000 ORDER BY salary DESC, birthday; 

SELECT avg(salary) as "Average", count(salary) as "Count" FROM persons WHERE salary > 100000;

SELECT concat(last_name, ' ', first_name) as "Full name" FROM persons WHERE sex = 'M';
SELECT length(last_name) as "Length" FROM persons WHERE sex = 'M';
SELECT strpos(second_name, 'ich') as "Index" FROM persons WHERE sex = 'M';

SELECT left(last_name, -2) FROM persons;
SELECT right(last_name, 2) FROM persons;
SELECT reverse(last_name) FROM persons;


SELECT replace(last_name, 'ov', 'off') FROM persons;

