DROP DATABASE IF EXISTS h2h_backend;
CREATE DATABASE h2h_backend;

\c h2h_backend;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    uid VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    username VARCHAR(100),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    photo VARCHAR(100),
    dob DATE,
    user_wins INT DEFAULT 0,
    user_losses INT DEFAULT 0,
    matches_played INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(20),
    team_pic VARCHAR(230),
    logo VARCHAR(230),
    player1_id INTEGER,
    player2_id INTEGER,
    player3_id INTEGER,
    player4_id INTEGER,
    player5_id INTEGER,
    captain_id INTEGER,
    team_wins INTEGER,
    team_loss INTEGER,
    matches_played INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (player1_id) REFERENCES users(id),
    FOREIGN KEY (player2_id) REFERENCES users(id),
    FOREIGN KEY (player3_id) REFERENCES users(id),
    FOREIGN KEY (player4_id) REFERENCES users(id),
    FOREIGN KEY (player5_id) REFERENCES users(id),
    FOREIGN KEY (captain_id) REFERENCES users(id)
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1_id INTEGER,
    team2_id INTEGER,
    address VARCHAR(30),
    state VARCHAR(13),
    city VARCHAR(20),
    zip VARCHAR(10),
    start_datetime TIMESTAMP WITH TIME ZONE,
    match_completed BOOLEAN DEFAULT FALSE,
    match_winner INTEGER DEFAULT NULL,
    match_loser INTEGER DEFAULT NULL,
    FOREIGN KEY (team1_id) REFERENCES team(id),
    FOREIGN KEY (team2_id) REFERENCES team(id)
);