-- db/schema.sql
DROP DATABASE IF EXISTS firebase_full;
CREATE DATABASE firebase_full;

\c firebase_full;


CREATE TABLE users (
    id VARCHAR(255) PRIMARY KEY,
    email VARCHAR(100),
    username VARCHAR(100),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

