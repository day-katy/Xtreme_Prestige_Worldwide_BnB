require 'listing'

describe Listing do
  describe '.all' do
    it 'returns the listings' do
      listings = Listing.all

      expect(listings).to include("Oscar's Parisian flat")
    end
  end
end
