CREATE TABLE countries(
    id serial PRIMARY KEY,
    cname varchar(64) NOT NULL UNIQUE,
    mainland varchar(64) NOT NULL
);

CREATE TABLE stadiums(
    id serial PRIMARY KEY,
    sname varchar(64) NOT NULL,
    country_id integer REFERENCES countries(id) NOT NULL,
    city varchar(64) NOT NULL,
    capacity integer NOT NULL,
    founding_date date NOT NULL,
    UNIQUE(sname, city)
);

CREATE TABLE clubs(
    id serial PRIMARY KEY,
    country_id integer REFERENCES countries(id) NOT NULL,
    stadium_id integer REFERENCES stadiums(id) NOT NULL,
    cname varchar(64) NOT NULL,
    founding_date date NOT NULL,
    UNIQUE(country_id, cname)
);

CREATE TABLE players(
    id serial PRIMARY KEY,
    country_id integer REFERENCES countries(id) NOT NULL,
    club_id integer REFERENCES clubs(id) NOT NULL,
    first_name varchar(64) NOT NULL,
    second_name varchar(64) NOT NULL,
    birthday date NOT NULL,
    pnumber integer NOT NULL,
    position varchar NOT NULL CHECK(position IN (
        'GK', 'LB', 'LWB', 'CB', 'RB', 'RWB', 'CM',
        'CDM', 'CAM',
        'LM', 'LW', 'RM', 'RW', 'CF', 'FRW')),
    UNIQUE(country_id, club_id, first_name, second_name, birthday, pnumber)
);

CREATE TABLE game(
    id serial PRIMARY KEY,
    club1_id integer REFERENCES clubs(id) NOT NULL,
    club2_id integer REFERENCES clubs(id) NOT NULL,
    stadium_id integer REFERENCES stadiums(id) NOT NULL,
    game_date date NOT NULL,
    game_time time NOT NULL,
    match_score varchar(10) NOT NULL,
    UNIQUE(club1_id, club2_id, game_date)
);

CREATE TABLE goals(
    id serial PRIMARY KEY,
    player_id integer REFERENCES players(id) NOT NULL,
    assist_id integer REFERENCES players(id) NOT NULL,
    game_id integer REFERENCES game(id) NOT NULL,
    gminute smallint NOT NULL,
    gtype char NOT NULL CHECK(gtype IN ('G', 'O')),
    UNIQUE(player_id, game_id, gminute)
);

CREATE TABLE foals(
    id serial PRIMARY KEY,
    player_id integer REFERENCES players(id) NOT NULL,
    game_id integer REFERENCES game(id) NOT NULL,
    fminute smallint NOT NULL,
    ftype varchar(2) NOT NULL CHECK(ftype in ('Y', 'SY', 'R')),
    UNIQUE(player_id, game_id, fminute, ftype)
);

CREATE TABLE groups(
    game_id integer REFERENCES game(id) NOT NULL UNIQUE,
    group_name varchar(2) NOT NULL,
    tour smallint NOT NULL,
    result varchar(2) NOT NULL CHECK(result in ('W1', 'W2', 'D'))
);

CREATE TABLE play_offs(
    id serial PRIMARY KEY,
    game1_id integer REFERENCES game(id) NOT NULL UNIQUE,
    game2_id integer REFERENCES game(id),
    rival_pare_id integer REFERENCES play_offs(id),
    add_time_score varchar(8),
    penalty varchar(8),
    result varchar(2) NOT NULL CHECK(result IN ('W1, W2')),
    stage varchar(10) NOT NULL CHECK(stage IN ('1/16', '1/8', '1/4', '1/2', 'Final'))
);

CREATE TABLE ClubAffilation(
    id serial PRIMARY KEY,
    club_id integer REFERENCES clubs(id) NOT NULL,
    player_id integer REFERENCES players(id) NOT NULL,
    tstart time NOT NULL,
    tend time
);

CREATE TABLE CountryAffilation(
    id serial PRIMARY KEY,
    country_id integer REFERENCES countries(id) NOT NULL,
    player_id integer REFERENCES players(id) NOT NULL,
    tstart time NOT NULL,
    tend time
);