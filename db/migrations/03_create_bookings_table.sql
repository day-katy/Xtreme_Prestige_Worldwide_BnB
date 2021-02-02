CREATE TABLE bookings (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users (id), listing_id INTEGER REFERENCES listings (id), date DATE);
