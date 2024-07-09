-- you do not need to seed users
-- you should run 'npm run db:init' to initialize the database
-- start your front and backends
-- instead now you should create users with firebase that will register also to your backend
-- when seeding other fields in other tables and you need the foreign key of user Id, retrieve the userIds from looking on postico or using psql
-- SELECT * from users 
-- manually place the id into your INSERT INTO values

-- SEEDING USERS:
-- to seed users w/o firebase use following keys:
-- id, password, email, created at
-- the other keys will be used for input forms when user customizes profile / creates matches / wins or loses a match
-- to query users from firebase use uid (not id)

\c h2h_backend;

-- Insert users
INSERT INTO users (uid, email, password, username, first_name, last_name, photo, dob, user_wins, user_losses, matches_played, created_at, updated_at)
VALUES
    (1, 'user1@example.com', 'password1', 'user1', 'John', 'Doe', 'user1.jpg', '1990-01-01', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'user2@example.com', 'password2', 'user2', 'Jane', 'Smith', 'user2.jpg', '1995-05-15', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 'user3@example.com', 'password3', 'user3', 'Michael', 'Johnson', 'user3.jpg', '1988-09-30', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO team (id, team_name, team_pic, logo, player1_id, player2_id, player3_id, captain_id, team_wins, team_loss, matches_played, created_at, updated_at)
VALUES
    (1, 'Team A', 'team_a_pic.jpg', 'team_a_logo.jpg', 1, 2, 3, 1, 2, 1, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'Team B', 'team_b_pic.jpg', 'team_b_logo.jpg', 2, 3, 1, 2, 1, 2, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO matches (id, team1_id, team2_id, address, state, city, zip, start_datetime, match_completed, match_winner, match_loser)
VALUES
    (1, 1, 2, '123 Main St', 'CA', 'Los Angeles', '90001', '2024-07-08 14:00:00', TRUE, 1, 2),
    (2, 2, 1, '456 Oak Ave', 'NY', 'New York', '10001', '2024-07-09 15:30:00', TRUE, 2, 1);