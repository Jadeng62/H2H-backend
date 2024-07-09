-- you do not need to seed users
-- you should run 'npm run db:init' to initialize the database
-- start your front and backends
-- instead now you should create users with firebase that will register also to your backend
-- when seeding other fields in other tables and you need the foreign key of user Id, retrieve the userIds from looking on postico or using psql
-- SELECT * from users 
-- manually place the id into your INSERT INTO values
\c h2h_backend

INSERT INTO matches (team1_id, team2_id, address, state, city, zip, start_datetime, match_completed, match_winner, match_loser) 
VALUES
( 1, 2, '123 Main St', 'CA', 'Los Angeles', '90001', '2023-07-10', FALSE, NULL, NULL),
( 1, 3, '123 Main St', 'CA', 'Los Angeles', '90001', '2023-07-11', FALSE, NULL, NULL);


