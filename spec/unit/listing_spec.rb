require 'listing'

describe Listing do

  describe '.all' do
    it 'returns the listings' do
      DatabaseConnection.query("INSERT INTO listings (name, free_date) VALUES ('Oscar''s Parisian Flat', 'June 1, 2021');")
      # DatabaseConnection.query("INSERT INTO listings (name, free_date) VALUES ('Tom''s Santiago Palace', 'July 1, 2021');")
      # DatabaseConnection.query("INSERT INTO listings (name, free_date) VALUES ('Jack''s Beach Shack', 'August 1, 2021');")

      listings = Listing.all

      # expect(listings[0].id).to include()
      expect(listings[0].name).to include("Oscar's Parisian Flat")
      expect(listings[0].free_date).to include("2021-06-01")

    end
  end
end
