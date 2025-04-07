DROP TABLE IF EXISTS countries CASCADE;
CREATE TABLE countries(
    id serial PRIMARY KEY,
    cname varchar(64) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS cities CASCADE;
CREATE TABLE cities(
    id serial PRIMARY KEY,
    cname varchar(64) NOT NULL,
    country_id integer REFERENCES countries(id) NOT NULL,
    cpopulation integer NOT NULL,
    UNIQUE(cname, country_id)
);

DROP TABLE IF EXISTS stadiums CASCADE;
CREATE TABLE stadiums(
    id serial PRIMARY KEY,
    city_id integer REFERENCES cities(id) NOT NULL,
    sname varchar(64) NOT NULL,
    capacity integer NOT NULL,
    founding_date date NOT NULL,
    UNIQUE(sname, city_id)
);

DROP TABLE IF EXISTS clubs CASCADE;
CREATE TABLE clubs(
    id serial PRIMARY KEY,
    city_id integer REFERENCES cities(id) NOT NULL,
    stadium_id integer REFERENCES stadiums(id) NOT NULL,
    cname varchar(64) NOT NULL,
    founding_date date NOT NULL,
    UNIQUE(city_id, cname)
);

DROP TABLE IF EXISTS players CASCADE;
CREATE TABLE players(
    id serial PRIMARY KEY,
    country_id integer REFERENCES countries(id) NOT NULL,
    club_id integer REFERENCES clubs(id) NOT NULL,
    pname varchar(64) NOT NULL,
    surname varchar(64) NOT NULL,
    birthday date NOT NULL,
    pnumber integer NOT NULL,
    position varchar NOT NULL CHECK(position IN (
        'GK', 'LB', 'LWB', 'CB', 'RB', 'RWB', 'CM', 'CDM', 'CAM',
        'LM', 'LW', 'RM', 'RW', 'CF', 'FRW'
    )),
    UNIQUE(country_id, club_id, pname, surname, birthday, pnumber)
);

DROP TABLE IF EXISTS game CASCADE;
CREATE TABLE games(
    id serial PRIMARY KEY,
    club1_id integer REFERENCES clubs(id) NOT NULL,
    club2_id integer REFERENCES clubs(id) NOT NULL,
    stadium_id integer REFERENCES stadiums(id) NOT NULL,
    gdate date NOT NULL,
    gtime time NOT NULL,
    score varchar(10) NOT NULL,
    UNIQUE(club1_id, club2_id, gdate)
);

DROP TABLE IF EXISTS goals CASCADE;
CREATE TABLE goals(
    player_id integer REFERENCES players(id) NOT NULL,
    game_id integer REFERENCES games(is) NOT NULL,
    min smallint NOT NULL,
    gtype char NOT NULL CHECK(gtype IN ('G', 'O')),
    UNIQUE(player_id, game_id, min)
);

DROP TABLE IF EXISTS foals CASCADE;
CREATE TABLE foals(
    player_id integer REFERENCES players(id) NOT NULL,
    game_id integer REFERENCES games(is) NOT NULL,
    min smallint NOT NULL,
    ftype varchar(2) NOT NULL CHECK(ftype in ('Y', 'SY', 'R')),
    UNIQUE(player_id, game_id, min, ftype)
);

DROP TABLE IF EXISTS groups CASCADE;
CREATE TABLE groups(
    game_id integer REFERENCES games(id) NOT NULL UNIQUE,
    group char NOT NULL,
    tour smallint NOT NULL,
    result varchar(2) NOT NULL CHECK(result in ('W1', 'W2', 'D'))
);

DROP TABLE IF EXISTS play-offs CASCADE;
CREATE TABLE play-offs(
    id serial PRIMARY KEY,
    game1_id integer REFERENCES games(id) NOT NULL UNIQUE,
    game2_id integer REFERENCES games(id),
    rival_pare_id integer REFERENCES play-offs(id),
    penlty varchar(8),
    result varchar(2) NOT NULL CHECK(result IN ('W1, W2')),
    stage varchar(10) NOT NULL CHECK(stage IN (
        '1/16', '1/8', '1/4', '1/2', 'Final'
    ))
);