-- db/seed.sql
\c firebase_full;

INSERT INTO users (id,name, email, created_at, updated_at)
VALUES 
('dJCId7hrpdghwM2rWbKcggvichv2','demo', 'demo@example.com', NOW(), NOW());
