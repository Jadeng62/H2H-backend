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
-- barney: 1VkAfJdTH5OSZtrqvpexsCMPMyx2 - 11
-- janette: nY3Kz1iJifVRfIRHlvSmzI7zoW03 - 12
-- johnny: aWcL4rlAFLSndBJAFESnBSjHzYz2 - 13
-- groot: xNQDT50b1ubAnFGeQ1wMTHZNspI2 - 14
-- erica: q6yZqvIn8SgYaajKDCpXbXjpEsJ2 - 15 

-- Team D
-- Desiree: hBylnkSsVUUjNhlCBAtTnX2EN893 - 16

--Team E
-- Matthew: 3lHMYdPmI5ejx41vf4A3zASoz0g2 -17

-- No Team Assigned
-- Adele: LUrxqd3Ov9TuYPVWOHcx6ysaEOg1 - 18
-- Britney: 9YGrpeiOfpTW3vHwEblaxHoor3n2 - 19
-- Leo: Qh1UJsv9pfUOhAEkcmIHbvww3ly1 -20

INSERT INTO users ( uid, user_team_id, position, email, username, first_name, last_name, photo, dob, user_wins, user_losses, matches_played, created_at, updated_at)
VALUES
    ('xyRPCR99eFMuy370hJNsXqQTMMs2',1,'point guard', 'lisadoe@mail.com', 'user1', 'Lisa', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1721243781/H2H/h2h-headshots/pexels-rdne-8337299_xmrqhs.jpg', '1990-01-01', 2, 1, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('JUJBze4P0iTyo7Md1VJOSGFffza2',1,'shooting guard', 'annadoe@mail.com', 'user2', 'Anna', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1721243795/H2H/h2h-headshots/pexels-biabrg-16933738_rnqo8d.jpg', '1995-05-15', 2, 1, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('imJcQHgkU8dvCLTYIU5HHR46YGH2',1,'small forward', 'olga@mail.com', 'user3', 'Olga', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1721243776/H2H/h2h-headshots/pexels-kuiyibo-13306905_zekp9z.jpg', '1988-09-30', 2, 1, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('ZtVGe5s5XXQmeuPhXwgwcBphGKd2',1, 'power forward', 'lilydoe4@mail.com', 'user4', 'Lily', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1721243769/H2H/h2h-headshots/pexels-gustavo-almeida-1559331-3060201_palpcs.jpg', '1992-03-18', 2, 1, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('JiFzRM68oAh5eKEp7g4aHe5pmkh2',1, 'center', 'jeffdoe@mail.com', 'user5', 'Jeff', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1721243783/H2H/h2h-headshots/pexels-thee_photo-orgasm-844573452-19880276_fhbssz.jpg', '1993-07-25', 2, 1, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('pEG6Va8IRzgJD8ajBno0jWuJijC2',2, 'point guard','barrydoe@mail.com', 'user6', 'Barry', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1720815637/H2H/andre-sebastian-C2Nf5iPOnz0-unsplash_xko2bi.jpg', '1994-11-12', 1, 2, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('SHllyhGebWfURlPFvFARgg7ao6w2',2, 'shooting guard','janedoe@mail.com', 'user7', 'Jane', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722875666/H2H/h2h-headshots/pexels-cottonbro-6777239_oajpmn.jpg', '1989-04-02', 1, 2, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('CYTa0byE4wNwp4ihgKDKHndw4eM2',2, 'small forward', 'johndoe@mail.com', 'user8', 'John', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722875697/H2H/h2h-headshots/pexels-tima-miroshnichenko-5586413_gfmsye.jpg', '1991-08-20', 1, 2, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('C9vRjJatYEdejvHJBMqNaoaegyK2',2, 'power forward','gretadoe@mail.com', 'user9', 'Greta', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722873860/H2H/h2h-headshots/allef-vinicius-OUQUY95XoF0-unsplash_dgzwje.jpg', '1996-02-14', 1, 2, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('FPvHHVh1M5Rwd45SbQmsXZn00pl2',2, 'center','ericdoe@mail.com', 'user10', 'Eric', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1721243765/H2H/h2h-headshots/pexels-azeddine-echrayby-288923761-13144690_unuhk7.jpg', '1997-06-30', 1, 2, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    ('1VkAfJdTH5OSZtrqvpexsCMPMyx2',3, 'point guard','barneydoe@mail.com', 'user11', 'Barney', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1721243798/H2H/h2h-headshots/pexels-gabby-k-5384571_ht7crf.jpg', '1994-11-12', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('nY3Kz1iJifVRfIRHlvSmzI7zoW03',3, 'shooting guard','janettdoe@mail.com', 'user12', 'Janett', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722873013/H2H/h2h-headshots/eric-gonzalez-JPcm3poCJkE-unsplash_ruaxrb.jpg', '1989-04-02', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('aWcL4rlAFLSndBJAFESnBSjHzYz2',3, 'small forward', 'johnnydoe@mail.com', 'user13', 'Johnny', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1721243778/H2H/h2h-headshots/pexels-raul-magdaleno-478518087-16852245_iyxcnh.jpg', '1991-08-20', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('xNQDT50b1ubAnFGeQ1wMTHZNspI2',3, 'power forward','grootdoe@mail.com', 'user14', 'Groot', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1721243790/H2H/h2h-headshots/pexels-tnarg-4625377_tfooo1.jpg', '1996-02-14', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('q6yZqvIn8SgYaajKDCpXbXjpEsJ2',3, 'center','ericadoe@mail.com', 'user15', 'Erica', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722873025/H2H/h2h-headshots/hayley-kim-studios-eot-ka5dM7Q-unsplash_l8huqf.jpg', '1997-06-30', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    ('hBylnkSsVUUjNhlCBAtTnX2EN893', 4, 'point guard', 'desireedoe@mail.com', 'user16', 'Desiree', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1721243795/H2H/h2h-headshots/pexels-biabrg-16933738_rnqo8d.jpg', '1995-03-18', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),

    ('3lHMYdPmI5ejx41vf4A3zASoz0g2', 5, 'point guard', 'matthewdoe@mail.com', 'user17', 'Matthew', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1721243775/H2H/h2h-headshots/pexels-kampus-6763720_gge9mz.jpg', '1993-12-05', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    
    ('LUrxqd3Ov9TuYPVWOHcx6ysaEOg1', NULL, 'shooting guard', 'adeledoe@mail.com', 'user18', 'Adele', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722873015/H2H/h2h-headshots/rene-ranisch-NW2AVFgqkAg-unsplash_rtcuns.jpg', '1988-09-22', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('9YGrpeiOfpTW3vHwEblaxHoor3n2', NULL, 'power forward', 'britneydoe@mail.com', 'user19', 'Britney', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722873014/H2H/h2h-headshots/1millidollars-rKvGzC4XFy8-unsplash_jgrb7r.jpg', '1990-11-08', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Qh1UJsv9pfUOhAEkcmIHbvww3ly1', NULL, 'center', 'leodoe@mail.com', 'user20', 'Leo', 'Doe', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1721243810/H2H/h2h-headshots/pexels-tima-miroshnichenko-5586402_s2mbhj.jpg', '1987-07-15', 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);


INSERT INTO team (team_name, team_pic, logo, point_guard_id, shooting_guard_id, small_forward_id, power_forward_id, center_id, captain_id, team_wins, team_loss, matches_played, created_at, updated_at)
VALUES
    ('D.U.M.B.O Sharks', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722621250/H2H/h2h-logos/original-5a8bd908e3923c251c8d2ac639fec579_zlu7z0.png', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722621250/H2H/h2h-logos/original-5a8bd908e3923c251c8d2ac639fec579_zlu7z0.png', 1, 2, 3, 4, 5, 1, 2, 1, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('BedStuy Cobras', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722621424/H2H/h2h-logos/original-9ffb523646daab00fd8e1dc82246178c_qbuwig.jpg', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722621424/H2H/h2h-logos/original-9ffb523646daab00fd8e1dc82246178c_qbuwig.jpg', 6, 7, 8, 9, 10, 8, 1, 2, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Morningside Hawks', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722621880/H2H/h2h-logos/image_processing20191007-12833-1m40z0e_ellabc.jpg', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722621880/H2H/h2h-logos/image_processing20191007-12833-1m40z0e_ellabc.jpg', 11, 12, 13, 14, 15, 11, 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('BK Doge', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722625201/H2H/h2h-logos/original-3c536de6ff903882f487a41378d4397a_rydypm.jpg', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722625201/H2H/h2h-logos/original-3c536de6ff903882f487a41378d4397a_rydypm.jpg', 16, NULL, NULL, NULL, NULL, 16, 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('Sugar Hill Lions', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722623541/H2H/h2h-logos/original-bf8aa182e7fd9980c4f61f29d025ef37_cgezgy.jpg', 'https://res.cloudinary.com/dwygxzqku/image/upload/v1722623541/H2H/h2h-logos/original-bf8aa182e7fd9980c4f61f29d025ef37_cgezgy.jpg', 17, NULL, NULL, NULL, NULL, 17, 0, 0, 0, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO matches (creator_id, team1_id, team2_id, park_name, address, borough, start_datetime, match_completed, match_winner, match_loser)
VALUES 
    (1, 1, 2,'Captain William Harry Thompson Playground', 'E 174 St. & Bronx River Ave.', 'Bronx', '2024-08-08 14:00:00', FALSE, NULL, NULL),
    (8, 2, 3,'52 Playground', 'Kelly St. & Ave. St. John', 'Bronx', '2024-08-09 15:30:00', FALSE, NULL, NULL);


INSERT INTO badges (name, description, icon_url, criteria) VALUES 
('All the World''s a Stage', 'Awarded when a player first creates their team to compete in the Head 2 Head arena.','https://res.cloudinary.com/dvmczcg3f/image/upload/b_rgb:FFFFFF/c_crop,ar_1:1/v1722482975/Head%202%20Head/globe_ktiqgs.jpg', '{"type": "team_creation", "value": true}'),
('All Hands on Deck', 'Unlocked when a team has a full roster.', 'https://res.cloudinary.com/dvmczcg3f/image/upload/c_crop,ar_1:1/v1722485530/Head%202%20Head/full_team_pic_z8f1ih.jpg', '{"type": "full_roster", "value": 5}'),
('Get Out of My Swamp!', 'Unlocked when a team has 3 consecutive wins at the same court.', 'https://res.cloudinary.com/dvmczcg3f/image/upload/c_crop,ar_1:1/v1722484078/Head%202%20Head/shrek_keep_out_sign_bplxek.jpg', '{"type": "consecutive_wins", "value": 3}'),
('Hope...', 'Given to the team that breaks a losing streak of 5 games.', 'https://res.cloudinary.com/dvmczcg3f/image/upload/v1722484987/Head%202%20Head/light_in_well_mouoxj.jpg', '{"type": "losing_streak_break", "value": 5}'),
('By the Gods!', 'Awarded when a team wins a game by 3 points or less.', 'https://res.cloudinary.com/dvmczcg3f/image/upload/v1722487180/Head%202%20Head/prayer_hand_candle_rmkpet.jpg', '{"type": "close_win", "value": 3}'),
('Sleeping Beauty', 'Awarded to a team that hasn''t signed up for a game for a week or more.', 'https://res.cloudinary.com/dvmczcg3f/image/upload/c_crop,ar_1:1/v1722488132/Head%202%20Head/beatup_basketball_cqxijn.jpg', '{"type": "inactive", "value": 7}'),
('The Vicious Cycle', 'Unlocked when a team''s number of wins and losses are equal (1:1 ratio).', 'https://res.cloudinary.com/dvmczcg3f/image/upload/c_crop,ar_1:1/v1722489375/Head%202%20Head/Screenshot_2024-08-01_at_1.16.07_AM_ovoidt.png', '{"type": "win_loss_ratio", "value": 1}');


-- Insert Champion Badge
INSERT INTO badges (name, description, icon_url, criteria) VALUES 
('The Crown', 'Awarded to the team with the most wins in the season.', 'https://res.cloudinary.com/dvmczcg3f/image/upload/c_crop,ar_1:1/v1722490358/Head%202%20Head/Screenshot_2024-08-01_at_1.29.31_AM_qr5xuy.png', '{"type": "most_wins", "value": "season"}');

-- Insert High Scorer Badge
INSERT INTO badges (name, description, icon_url, criteria) VALUES 
('High Scorer', 'Given to the team with the highest average points per game in the season.', 'https://res.cloudinary.com/dvmczcg3f/image/upload/c_crop,ar_1:1/v1721078532/Head%202%20Head/baketball_emblem_jeapt4.jpg', '{"type": "highest_average_points", "value": "season"}');


-- Add badges for Team 1
INSERT INTO team_badges (team_id, badge_id, earned_at)
VALUES
    (1, 1, '2024-01-01 10:00:00'), -- Create team badge 
    (1, 2, '2024-01-01 10:00:00'); -- Full Roster Badge

-- Add badges for Team 2
INSERT INTO team_badges (team_id, badge_id, earned_at)
VALUES
    (2, 1, '2024-01-02 11:00:00'), -- Team Player Badge
    (2, 2, '2024-01-02 11:00:00'); -- Full Roster Badge Badge