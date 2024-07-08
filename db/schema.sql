DROP DATABASE IF EXISTS h2h_backend;
CREATE DATABASE h2h_backend;

\c h2h_backend;

CREATE TABLE users (
    -- id SERIAL PRIMARY KEY,
    uid VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
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

-- CREATE TABLE team (
--     id SERIAL PRIMARY KEY,
--     team_name VARCHAR(100),
--     team_pic VARCHAR(255),
--     logo VARCHAR(255),
--     player1_id VARCHAR(255),
--     player2_id VARCHAR(255),
--     player3_id VARCHAR(255),
--     player4_id VARCHAR(255),
--     player5_id VARCHAR(255),
--     captain_id VARCHAR(255),
--     team_wins INTEGER,
--     team_loss INTEGER,
--     matches_played INTEGER,
--     created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--     updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (player1_id) REFERENCES users(uid),
--     FOREIGN KEY (player2_id) REFERENCES users(uid),
--     FOREIGN KEY (player3_id) REFERENCES users(uid),
--     FOREIGN KEY (player4_id) REFERENCES users(uid),
--     FOREIGN KEY (player5_id) REFERENCES users(uid),
--     FOREIGN KEY (captain_id) REFERENCES users(uid)
-- );

-- added CASCADE so that if a user in users table (referenced by uid) is deleted corresponding team records where columns reference that user will also be deleted automatically!!
CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(100),
    team_pic VARCHAR(255),
    logo VARCHAR(255),
    player1_id VARCHAR(255) REFERENCES users(uid) ON DELETE CASCADE,
    player2_id VARCHAR(255) REFERENCES users(uid) ON DELETE CASCADE,
    player3_id VARCHAR(255) REFERENCES users(uid) ON DELETE CASCADE,
    player4_id VARCHAR(255) REFERENCES users(uid) ON DELETE CASCADE,
    player5_id VARCHAR(255) REFERENCES users(uid) ON DELETE CASCADE,
    captain_id VARCHAR(255) REFERENCES users(uid) ON DELETE CASCADE,
    team_wins INTEGER,
    team_loss INTEGER,
    matches_played INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- CREATE TABLE matches (
--     id SERIAL PRIMARY KEY,
--     team1_id INTEGER,
--     team2_id INTEGER,
--     address VARCHAR(100),
--     state VARCHAR(20),
--     city VARCHAR(20),
--     zip VARCHAR(10),
--     start_datetime TIMESTAMP WITH TIME ZONE,
--     match_completed BOOLEAN DEFAULT FALSE,
--     match_winner INTEGER DEFAULT NULL,
--     match_loser INTEGER DEFAULT NULL,
--     FOREIGN KEY (team1_id) REFERENCES team(id),
--     FOREIGN KEY (team2_id) REFERENCES team(id)
-- );

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1_id INTEGER REFERENCES team(id) ON DELETE CASCADE,
    team2_id INTEGER REFERENCES team(id) ON DELETE CASCADE,
    address VARCHAR(100),
    state VARCHAR(20),
    city VARCHAR(20),
    zip VARCHAR(10),
    start_datetime TIMESTAMP WITH TIME ZONE,
    match_completed BOOLEAN DEFAULT FALSE,
    match_winner INTEGER DEFAULT NULL,
    match_loser INTEGER DEFAULT NULL
);
