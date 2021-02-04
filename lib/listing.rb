  require './lib/database_connection'
  require 'pg'

class Listing

  attr_reader :listing_id, :name, :free_date

  def initialize(listing_id:, name:, free_date:)
    @listing_id = listing_id
    @name = name
    @free_date = free_date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM listings;")

    result.map do |listing|
      Listing.new(listing_id: listing['listing_id'], name: listing['name'], free_date: listing['free_date'])
    end

  end

  def self.create(name:, free_date:)
    result = DatabaseConnection.query("INSERT INTO listings (name, free_date)
    VALUES ('#{name}', '#{free_date}')
    RETURNING listing_id, name, free_date;")

    Listing.new(listing_id: result[0]['listing_id'], name: result[0]['name'], free_date: result[0]['free_date'])

  end

  def self.find(listing_id:)
    result = DatabaseConnection.query("SELECT * FROM listings WHERE listing_id = #{listing_id};")
    Listing.new(listing_id: result[0]['listing_id'], name: result[0]['name'], free_date: result[0]['free_date'])

  end

end
