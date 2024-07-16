-- you do not need to seed users
-- you should run 'npm run db:init' to initialize the database
-- start your front and backends
-- instead now you should create users with firebase that will register also to your backend
-- when seeding other fields in other tables and you need the foreign key of user Id, retrieve the userIds from looking on postico or using psql
-- SELECT * from users
-- manually place the id into your INSERT INTO values

\c h2h_backend

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

-- Team C
-- barney: 
-- janette: 
-- johnny: 
-- groot:
-- erica:

-- No Team Assigned
-- Desiree: 
-- Matthew:
-- Adele:
-- Britney:
-- Leo:

INSERT INTO users ( uid, user_team_id, position, email, username, first_name, last_name, photo, dob, user_wins, user_losses, matches_played, created_at, updated_at)
VALUES
    ('xyRPCR99eFMuy370hJNsXqQTMMs2',1,'point guard', 'lisadoe@mail.com', 'user1', 'Lisa', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815634/H2H/avdalyan-DQjWG8NBGWg-unsplash_qg15ht.jpg', '1990-01-01', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('JUJBze4P0iTyo7Md1VJOSGFffza2',1,'shooting guard', 'annadoe@mail.com', 'user2', 'Anna', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815632/H2H/christine-murphy-ld0SijDh-SI-unsplash_sgao3c.jpg', '1995-05-15', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('imJcQHgkU8dvCLTYIU5HHR46YGH2',1,'small forward', 'olga@mail.com', 'user3', 'Olga', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815631/H2H/brian-lawson-PY3VNWIDYhE-unsplash_dzx7dp.jpg', '1988-09-30', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('ZtVGe5s5XXQmeuPhXwgwcBphGKd2',1, 'power forward', 'lilydoe4@mail.com', 'user4', 'Lily', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815638/H2H/anupam-roy-993qsAlrjQs-unsplash_raicsd.jpg', '1992-03-18', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('JiFzRM68oAh5eKEp7g4aHe5pmkh2',1, 'center', 'jeffdoe@mail.com', 'user5', 'Jeff', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815635/H2H/brian-lundquist-7B4zs9M8rYI-unsplash_x8ocgj.jpg', '1993-07-25', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('pEG6Va8IRzgJD8ajBno0jWuJijC2',2, 'point guard','barrydoe@mail.com', 'user6', 'Barry', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815637/H2H/andre-sebastian-C2Nf5iPOnz0-unsplash_xko2bi.jpg', '1994-11-12', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('SHllyhGebWfURlPFvFARgg7ao6w2',2, 'shooting guard','janedoe@mail.com', 'user7', 'Jane', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815645/H2H/gideon-hezekiah-WCEMFqEIVek-unsplash_yo1e1o.jpg', '1989-04-02', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('CYTa0byE4wNwp4ihgKDKHndw4eM2',2, 'small forward', 'johndoe@mail.com', 'user8', 'John', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815642/H2H/courtney-hill-b7P2CrRhYf0-unsplash_aplghx.jpg', '1991-08-20', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('C9vRjJatYEdejvHJBMqNaoaegyK2',2, 'power forward','gretadoe@mail.com', 'user9', 'Greta', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815645/H2H/dillon-kydd-tHk6m4vgMys-unsplash_b7rbcs.jpg', '1996-02-14', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('FPvHHVh1M5Rwd45SbQmsXZn00pl2',2, 'center','ericdoe@mail.com', 'user10', 'Eric', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815647/H2H/emrecan-arik-apJKb2Js_Vg-unsplash_qjrslb.jpg', '1997-06-30', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    -- barney, janette, johnny, groot, erica are registered users but uid needs to be updated to the one that's actually in firebase

    ('pEG6Va8IRzgJD8ajBno0iWuJijC2',3, 'point guard','barneydoe@mail.com', 'user11', 'Barney', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815656/H2H/julian-myles-I2g6Oe9ElbE-unsplash_ivqnx0.jpg', '1994-11-12', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('SHllyhGebWfURlPFvFARig7ao6w2',3, 'shooting guard','janettdoe@mail.com', 'user12', 'Janett', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815651/H2H/gabriel-silverio-u3WmDyKGsrY-unsplash_glpbn7.jpg', '1989-04-02', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('CYTa0byE4wNwp4ihgKDiHndw4eM2',3, 'small forward', 'johnnydoe@mail.com', 'user13', 'Johnny', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815659/H2H/josh-scorpio-H3Tuh0hwYQk-unsplash_ohgnai.jpg', '1991-08-20', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('C9vRjJatYEdejvHJBMqiaoaegyK2',3, 'power forward','grootdoe@mail.com', 'user14', 'Groot', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815665/H2H/karsten-winegeart-Nz0d2wxw0t4-unsplash_hwadtn.jpg', '1996-02-14', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('FPvHHVh1M5Rwd45SbQisXZn00pl2',3, 'center','ericadoe@mail.com', 'user15', 'Erica', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815654/H2H/jason-moyer-7JmGPyljOSE-unsplash_vytxg2.jpg', '1997-06-30', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    ('auth_id_for_Desiree', NULL, NULL, 'desireedoe@mail.com', 'user16', 'Desiree', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815661/H2H/kimson-doan-HD8KlyWRYYM-unsplash_strpc2.jpg', '1995-03-18', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('auth_id_for_Matthew', NULL, NULL, 'matthewdoe@mail.com', 'user17', 'Matthew', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815665/H2H/karabo-mdluli-nRwJaWg7McU-unsplash_hcuaid.jpg', '1993-12-05', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('auth_id_for_Adele', NULL, NULL, 'adeledoe@mail.com', 'user18', 'Adele', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815673/H2H/omid-armin-g9dpfgrSyR8-unsplash_ng4vc0.jpg', '1988-09-22', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('auth_id_for_Britney', NULL, NULL, 'britneydoe@mail.com', 'user19', 'Britney', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815684/H2H/prince-akachi-J1OScm_uHUQ-unsplash_kocdrs.jpg', '1990-11-08', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('auth_id_for_Leo', NULL, NULL, 'leodoe@mail.com', 'user20', 'Leo', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815691/H2H/rodney-gainous-jr-p_VF71muhRs-unsplash_eppcl1.jpg', '1987-07-15', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


INSERT INTO team (team_name, team_pic, logo, point_guard_id, shooting_guard_id, small_forward_id, power_forward_id, center_id, captain_id, team_wins, team_loss, matches_played, created_at, updated_at)
VALUES
    ('Team A', 'team_a_pic.jpg', 'team_a_logo.jpg', 1, 2, 3, 4, 5, 1, 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team B', 'team_b_pic.jpg', 'team_b_logo.jpg', 6, 7, 8, 9, 10, 9, 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Team C', 'team_c_pic.jpg', 'team_c_logo.jpg', 11, 12, 13, 14, 15, 11, 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO matches (team1_id, team2_id, address, state, city, zip, start_datetime, match_completed, match_winner, match_loser)
VALUES
    (1, 2, '123 Main St', 'CA', 'Los Angeles', '90001', '2024-07-08 14:00:00', TRUE, 1, 2),
    (2, 3, '456 Oak Ave', 'NY', 'New York', '10001', '2024-07-09 15:30:00', TRUE, 2, 1);