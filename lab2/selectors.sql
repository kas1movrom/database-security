INSERT INTO countries(cname, mainland) VALUES('England', 'Europe');
INSERT INTO countries(cname, mainland) VALUES('Spain', 'Europe');
INSERT INTO countries(cname, mainland) VALUES('France', 'Europe');
INSERT INTO countries(cname, mainland) VALUES('Germany', 'Europe');
INSERT INTO countries(cname, mainland) VALUES('Italy', 'Europe');
INSERT INTO countries(cname, mainland) VALUES('Russia', 'Asia');

INSERT INTO stadiums(sname, country_id, city, capacity, founding_date) VALUES('Anfield', 1, 'Liverpool', 63000, '1911-09-25');
INSERT INTO stadiums(sname, country_id, city, capacity, founding_date) VALUES('Santiago Bernabeu', 2, 'Madrid', 95000, '1912-04-22');
INSERT INTO stadiums(sname, country_id, city, capacity, founding_date) VALUES('Nou Camp', 2, 'Barcelona', 93000, '1913-09-16');
INSERT INTO stadiums(sname, country_id, city, capacity, founding_date) VALUES('Alianz Arena', 4, 'Munich', 75000, '1930-10-25');
INSERT INTO stadiums(sname, country_id, city, capacity, founding_date) VALUES('Juseppe Miazo', 5, 'Milan', 78000, '1900-04-01');
INSERT INTO stadiums(sname, country_id, city, capacity, founding_date) VALUES('Par de France', 3, 'Paris', 67000, '1911-09-25');
INSERT INTO stadiums(sname, country_id, city, capacity, founding_date) VALUES('Web Arena', 6, 'Moscow', 30000, '2014-01-01');
INSERT INTO stadiums(sname, country_id, city, capacity, founding_date) VALUES('Emirates', 1, 'London', 54000, '1990-03-15');
INSERT INTO stadiums(sname, country_id, city, capacity, founding_date) VALUES('Wembley', 1, 'London', 97000, '1990-03-25');

INSERT INTO clubs(country_id, stadium_id, cname, founding_date) VALUES(1, 1, 'Liverpool', '1911-09-25');
INSERT INTO clubs(country_id, stadium_id, cname, founding_date) VALUES(1, 8, 'Arsenal', '1934-07-30');
INSERT INTO clubs(country_id, stadium_id, cname, founding_date) VALUES(4, 4, 'Bayern Munich', '1910-11-17');
INSERT INTO clubs(country_id, stadium_id, cname, founding_date) VALUES(3, 6, 'PSG', '1938-12-05');
INSERT INTO clubs(country_id, stadium_id, cname, founding_date) VALUES(2, 2, 'Real Madrid', '1909-07-07');
INSERT INTO clubs(country_id, stadium_id, cname, founding_date) VALUES(2, 3, 'Barcelona', '1909-07-07');
INSERT INTO clubs(country_id, stadium_id, cname, founding_date) VALUES(6, 7, 'CSKA', '1911-02-08');
INSERT INTO clubs(country_id, stadium_id, cname, founding_date) VALUES(5, 5, 'Internazionalle', '1934-10-06');

INSERT INTO game(club1_id, club2_id, stadium_id, game_date , game_time, match_score) VALUES(1, 5, 1, '2025-11-17', '11:00', '2:0')