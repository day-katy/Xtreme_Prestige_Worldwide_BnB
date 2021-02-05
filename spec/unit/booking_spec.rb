describe Booking do
  describe '.book' do
    it 'makes a booking' do
      listing = Listing.create(name: 'Oscar''s Parisian Flat', free_date: '2021-09-09', price: 400, description: 'very french', image:'-')
      user = Users.create(email: 'test@email.com', password: 'password', name: 'Charlie')

      # user = double('User', :id => 1)
      # listing = double('Listing', :id => 1, :free_date => '2021-09-09')

      booking = Booking.create(user_id: user.user_id, listing_id: listing.listing_id, date: listing.free_date)
      expect(Booking.all[0].user_id).to eq user.user_id
      expect(Booking.all[0].listing_id).to eq listing.listing_id
      expect(Booking.all[0].date).to eq booking.date
    end
  end
end
