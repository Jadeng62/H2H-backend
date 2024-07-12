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
INSERT INTO users (id, uid, user_team_id, position, email, username, first_name, last_name, photo, dob, user_wins, user_losses, matches_played, created_at, updated_at)
VALUES
    (1,'xyRPCR99eFMuy370hJNsXqQTMMs2',1,'point guard', 'lisadoe@mail.com', 'user1', 'Lisa', 'Doe', 'user1.jpg', '1990-01-01', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2,'JUJBze4P0iTyo7Md1VJOSGFffza2',1,'shooting guard', 'annadoe@mail.com', 'user2', 'Anna', 'Doe', 'user2.jpg', '1995-05-15', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3,'imJcQHgkU8dvCLTYIU5HHR46YGH2',1,'small forward', 'olga@mail.com', 'user3', 'Olga', 'Doe', 'user3.jpg', '1988-09-30', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4,'ZtVGe5s5XXQmeuPhXwgwcBphGKd2',1, 'power forward', 'lilydoe4@mail.com', 'user4', 'Lily', 'Doe', 'user4.jpg', '1992-03-18', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (5,'JiFzRM68oAh5eKEp7g4aHe5pmkh2',1, 'center', 'jeffdoe@mail.com', 'user5', 'Jeff', 'Doe', 'user5.jpg', '1993-07-25', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (6,'pEG6Va8IRzgJD8ajBno0jWuJijC2',2, 'point guard','barrydoe@mail.com', 'user6', 'Barry', 'Doe', 'user6.jpg', '1994-11-12', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (7,'SHllyhGebWfURlPFvFARgg7ao6w2',2, 'shooting guard','janedoe@mail.com', 'user7', 'Jane', 'Doe', 'user7.jpg', '1989-04-02', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (8,'CYTa0byE4wNwp4ihgKDKHndw4eM2',2, 'small forward', 'johndoe@mail.com', 'user8', 'John', 'Doe', 'user8.jpg', '1991-08-20', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (9,'C9vRjJatYEdejvHJBMqNaoaegyK2',2, 'power forward','gretadoe@mail.com', 'user9', 'Greta', 'Doe', 'user9.jpg', '1996-02-14', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (10,'FPvHHVh1M5Rwd45SbQmsXZn00pl2',2, 'center','ericdoe@mail.com', 'user10', 'Eric', 'Doe', 'user10.jpg', '1997-06-30', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- barney, janette, johnny, groot, erica are registered users but uid needs to be updated to the one that's actually in firebase
    (11,'pEG6Va8IRzgJD8ajBno0iWuJijC2',3, 'point guard','barneydoe@mail.com', 'user11', 'Barney', 'Doe', 'user6.jpg', '1994-11-12', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (12,'SHllyhGebWfURlPFvFARig7ao6w2',3, 'shooting guard','janettdoe@mail.com', 'user12', 'Janett', 'Doe', 'user7.jpg', '1989-04-02', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (13,'CYTa0byE4wNwp4ihgKDiHndw4eM2',3, 'small forward', 'johnnydoe@mail.com', 'user13', 'Johnny', 'Doe', 'user8.jpg', '1991-08-20', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (14,'C9vRjJatYEdejvHJBMqiaoaegyK2',3, 'power forward','grootdoe@mail.com', 'user14', 'Groot', 'Doe', 'user9.jpg', '1996-02-14', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (15,'FPvHHVh1M5Rwd45SbQisXZn00pl2',3, 'center','ericadoe@mail.com', 'user15', 'Erica', 'Doe', 'user10.jpg', '1997-06-30', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

    -- (16, 'auth_id_for_Desiree', NULL, NULL, 'desireedoe@mail.com', 'user16', 'Desiree', 'Doe', NULL, '1995-03-18', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    -- (17, 'auth_id_for_Matthew', NULL, NULL, 'matthewdoe@mail.com', 'user17', 'Matthew', 'Doe', NULL, '1993-12-05', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    -- (18, 'auth_id_for_Adele', NULL, NULL, 'adeledoe@mail.com', 'user18', 'Adele', 'Doe', NULL, '1988-09-22', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    -- (19, 'auth_id_for_Britney', NULL, NULL, 'britneydoe@mail.com', 'user19', 'Britney', 'Doe', NULL, '1990-11-08', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    -- (20, 'auth_id_for_Leo', NULL, NULL, 'leodoe@mail.com', 'user20', 'Leo', 'Doe', NULL, '1987-07-15', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
-- uids from Firebase
-- Team A
-- lisa:xyRPCR99eFMuy370hJNsXqQTMMs2 - 1
-- anna:JUJBze4P0iTyo7Md1VJOSGFffza2 - 2
-- olga:imJcQHgkU8dvCLTYIU5HHR46YGH2 - 3
-- lily:ZtVGe5s5XXQmeuPhXwgwcBphGKd2 - 4
-- jeff:JiFzRM68oAh5eKEp7g4aHe5pmkh2 - 5
-- Team B
-- barry:pEG6Va8IRzgJD8ajBno0jWuJijC2 - 6
-- greta:C9vRjJatYEdejvHJBMqNaoaegyK2 - 9
-- jane:SHllyhGebWfURlPFvFARgg7ao6w2 - 7
-- john:CYTa0byE4wNwp4ihgKDKHndw4eM2 - 8
-- Eric:FPvHHVh1M5Rwd45SbQmsXZn00pl2 - 10
INSERT INTO team (team_name, team_pic, logo, point_guard_id, shooting_guard_id, small_forward_id, power_forward_id, center_id, captain_id, team_wins, team_loss, matches_played, created_at, updated_at)
VALUES
    ('Team A', 'team_a_pic.jpg', 'team_a_logo.jpg', 1, 2, 3, 4, 5, 1, 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team B', 'team_b_pic.jpg', 'team_b_logo.jpg', 6, 7, 8, 9, 10, 9, 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team C', 'team_c_pic.jpg', 'team_c_logo.jpg', 11, 12, 13, 14, 15, 11, 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO matches (team1_id, team2_id, address, state, city, zip, start_datetime, match_completed, match_winner, match_loser)
VALUES
    (1, 2, '123 Main St', 'CA', 'Los Angeles', '90001', '2024-07-08 14:00:00', TRUE, 1, 2),
    (2, 3, '456 Oak Ave', 'NY', 'New York', '10001', '2024-07-09 15:30:00', TRUE, 2, 1);