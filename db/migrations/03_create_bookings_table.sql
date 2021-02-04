CREATE TABLE bookings (booking_id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users (user_id), listing_id INTEGER REFERENCES listings (listing_id), date DATE);
