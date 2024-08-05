DROP DATABASE IF EXISTS h2h_backend;
CREATE DATABASE h2h_backend;

\c h2h_backend;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    uid VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    username VARCHAR(100) UNIQUE NOT NULL,
    user_team_id INT DEFAULT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    photo TEXT,
    dob DATE,
    user_wins INT DEFAULT 0,
    user_losses INT DEFAULT 0,
    matches_played INTEGER DEFAULT 0,
    position VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    team_name VARCHAR(100) UNIQUE,
    team_pic VARCHAR(255),
    logo VARCHAR(255),
    point_guard_id INT REFERENCES users(id) ON DELETE SET NULL,
    shooting_guard_id INT REFERENCES users(id) ON DELETE SET NULL,
    small_forward_id INT REFERENCES users(id) ON DELETE SET NULL,
    power_forward_id INT REFERENCES users(id) ON DELETE SET NULL,
    center_id INT REFERENCES users(id) ON DELETE SET NULL,
    captain_id INT REFERENCES users(id) ON DELETE SET NULL,
    team_wins INTEGER,
    team_loss INTEGER,
    matches_played INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE badges (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    icon_url TEXT,
    criteria JSON
);

CREATE TABLE team_badges (
    team_id INT REFERENCES team(id) ON DELETE CASCADE,
    badge_id INT REFERENCES badges(id) ON DELETE CASCADE,
    earned_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (team_id, badge_id)
);

-- CREATE TABLE team_captains (
--     team_id SERIAL PRIMARY KEY,
--     captain_id INT REFERENCES users(id) ON DELETE CASCADE,
--     FOREIGN KEY (team_id) REFERENCES team(id) ON DELETE CASCADE
-- );

-- team1_id is automatically assigned to team captain that created the match (only person that can edit it)
-- extract captain_id from team1_id
CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    creator_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    team1_id INTEGER REFERENCES team(id) ON DELETE SET NULL,
    team2_id INTEGER REFERENCES team(id) ON DELETE SET NULL,
    park_name VARCHAR(255),
    address VARCHAR(100),
    borough VARCHAR (100),
    start_datetime TIMESTAMP WITH TIME ZONE,
    match_completed BOOLEAN DEFAULT FALSE,
    match_winner INTEGER DEFAULT NULL,
    match_loser INTEGER DEFAULT NULL
);

-- Add the results table
CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches(id) ON DELETE CASCADE,
    team_1_submitted_winner INTEGER REFERENCES team(id),
    team_2_submitted_winner INTEGER REFERENCES team(id),
    MVP INTEGER REFERENCES users(id)
);

