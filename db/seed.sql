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

-- uids from Firebase
-- lisa:xyRPCR99eFMuy370hJNsXqQTMMs2
-- anna:JUJBze4P0iTyo7Md1VJOSGFffza2
-- olga:imJcQHgkU8dvCLTYIU5HHR46YGH2
-- lily:ZtVGe5s5XXQmeuPhXwgwcBphGKd2
-- jeff:JiFzRM68oAh5eKEp7g4aHe5pmkh2

-- sam:jbxWhN2nnUeAst3717q6nSHKe9f1
-- demo:Udq3thBeYwTXZP6K7Z7WWN78kBp1
-- jane:SHllyhGebWfURlPFvFARgg7ao6w2
-- john:CYTa0byE4wNwp4ihgKDKHndw4eM2
-- Eric:FPvHHVh1M5Rwd45SbQmsXZn00pl2

INSERT INTO team (id, team_name, team_pic, logo, player1_id, player2_id, player3_id, player4_id, player5_id, captain_id, team_wins, team_loss, matches_played, created_at, updated_at)
VALUES
    (1, 'Team A', 'team_a_pic.jpg', 'team_a_logo.jpg', 'xyRPCR99eFMuy370hJNsXqQTMMs2', 'JUJBze4P0iTyo7Md1VJOSGFffza2', 'imJcQHgkU8dvCLTYIU5HHR46YGH2', 'ZtVGe5s5XXQmeuPhXwgwcBphGKd2', 'JiFzRM68oAh5eKEp7g4aHe5pmkh2', 'xyRPCR99eFMuy370hJNsXqQTMMs2', 3, 4, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 'Team B', 'team_b_pic.jpg', 'team_b_logo.jpg', 'jbxWhN2nnUeAst3717q6nSHKe9f1', 'Udq3thBeYwTXZP6K7Z7WWN78kBp1', 'SHllyhGebWfURlPFvFARgg7ao6w2', 'CYTa0byE4wNwp4ihgKDKHndw4eM2', 'FPvHHVh1M5Rwd45SbQmsXZn00pl2', 'jbxWhN2nnUeAst3717q6nSHKe9f1', 4, 3, 7, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


INSERT INTO matches (id, team1_id, team2_id, address, state, city, zip, start_datetime, match_completed, match_winner, match_loser)
VALUES
    (1, 1, 2, '123 Main St', 'CA', 'Los Angeles', '90001', '2024-07-08 14:00:00', TRUE, 1, 2),
    (2, 2, 1, '456 Oak Ave', 'NY', 'New York', '10001', '2024-07-09 15:30:00', TRUE, 2, 1);