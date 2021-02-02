class Booking
  attr_reader :user_id, :listing_id, :date
  def initialize(id:, user_id:, listing_id:, date:)
    @id = id
    @user_id = user_id
    @listing_id = listing_id
    @date = date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM bookings;")

    result.map do |booking|
      Booking.new(id: booking['id'], user_id: booking['user_id'], listing_id: booking['listing_id'], date: booking['date'])
    end
  end

  def self.create(user_id:, listing_id:, date:)
    result = DatabaseConnection.query("INSERT INTO bookings (user_id, listing_id, date)
                              VALUES ('#{user_id}', '#{listing_id}', '#{date}')
                              RETURNING id, user_id, listing_id, date;")

    Booking.new(id: result[0]['id'], user_id: result[0]['user_id'],
                listing_id: result[0]['listing_id'], date: result[0]['date'])
  end

end
