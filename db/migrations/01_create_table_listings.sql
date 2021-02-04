CREATE TABLE listings (id SERIAL PRIMARY KEY, name VARCHAR(60), free_date DATE, host_id INTEGER REFERENCES users (user_id));
