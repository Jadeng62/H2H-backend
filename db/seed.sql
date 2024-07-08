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

INSERT INTO users (id, uid, email, password, username, first_name, last_name, photo, dob, user_wins, user_losses, matches_played)
VALUES
    (1,'uid1', 'user1@example.com', 'password1', 'user1', 'John', 'Doe', 'user1.jpg', '1990-01-01', 0, 0, 0),
    (2,'uid2', 'user2@example.com', 'password2', 'user2', 'Jane', 'Smith', 'user2.jpg', '1995-05-15', 0, 0, 0),
    (3,'uid3', 'user3@example.com', 'password3', 'user3', 'Michael', 'Johnson', 'user3.jpg', '1985-09-20', 0, 0, 0);

INSERT INTO team (id, team_name, team_pic, logo, player1_id, player2_id, player3_id, player4_id, player5_id, captain_id, team_wins, team_loss, matches_played)
VALUES
    (1, 'Team A', 'teamA.jpg', 'logoA.jpg', 1, 2, 3, NULL, NULL, 1, 0, 0, 0),
    (2, 'Team B', 'teamB.jpg', 'logoB.jpg', 2, 3, NULL, NULL, NULL, 2, 0, 0, 0),
    (3, 'Team C', 'teamC.jpg', 'logoC.jpg', 1, NULL, NULL, NULL, NULL, 3, 0, 0, 0);

INSERT INTO matches (team1_id, team2_id, address, state, city, zip, start_datetime, match_completed, match_winner, match_loser)
VALUES
    (1, 2, '123 Main St', 'CA', 'San Francisco', '94105', '2024-07-10 14:00:00-07', FALSE, NULL, NULL),
    (2, 3, '456 Oak Ave', 'NY', 'New York City', '10001', '2024-07-12 15:30:00-04', FALSE, NULL, NULL);

-- Confirm stuff
-- SELECT * FROM users;
-- SELECT * FROM team;
-- SELECT * FROM matches;