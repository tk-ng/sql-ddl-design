DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT,
    city TEXT
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT,
    current_team_id INTEGER REFERENCES teams
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    date DATE,
    team1 INTEGER REFERENCES teams,
    team2 INTEGER REFERENCES teams,
    season_id INTEGER REFERENCES season,
    head_referee INTEGER REFERENCES referees,
    assistant_referee1 INTEGER REFERENCES referees,
    assistant_referee2 INTEGER REFERENCES referees
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players,
    game_id INTEGER REFERENCES games
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams,
    game_id INTEGER REFERENCES games,
    result TEXT CHECK (result in ('win','loss','draw'))
);