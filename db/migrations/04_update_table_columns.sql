ALTER TABLE listings ADD COLUMN host_id INTEGER REFERENCES users (user_id);

ALTER TABLE "public"."listings" ADD COLUMN "image" varchar;
ALTER TABLE "public"."listings" ADD COLUMN "description" varchar(120);
ALTER TABLE "public"."listings" ADD COLUMN "price" varchar(60);

# Steps

* Changed id in listings to listing_id
* Changed id in bookings to booking_id
* Changed id in users to user_id
* Changed all classes, rspec tests, app.rb, views
