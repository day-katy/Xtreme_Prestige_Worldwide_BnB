  require './lib/database_connection'
  require 'pg'

class Listing

  attr_reader :listing_id, :name, :free_date , :host_id, :price, :description, :image

  def initialize(listing_id:, name:, free_date:, host_id:, price:, description:, image:)
    @listing_id = listing_id
    @name = name
    @free_date = free_date
    @host_id = host_id
    @price = price
    @description = description
    @image = image
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM listings;")
    result.map do |listing|
      Listing.new(listing_id: listing['listing_id'], name: listing['name'],
                  free_date: listing['free_date'], host_id: listing['host_id'],
                  price: listing['price'], description: listing['description'],
                  image: listing['image'])
    end

  end


  def self.create(name:, free_date:, host_id:, price:, description:, image:)
    result = DatabaseConnection.query("INSERT INTO listings (name, free_date, host_id, price, description, image)
    VALUES ('#{name}', '#{free_date}', '#{host_id}', '#{price}', '#{description}', '#{image}') RETURNING listing_id, name, free_date, host_id, price, description, image;")

    Listing.new(listing_id: result[0]['listing_id'], name: result[0]['name'],
                free_date: result[0]['free_date'], host_id: result[0]['host_id'],
                price: result[0]['price'], description: result[0]['description'],
                image: result[0]['image'])
  end


  def self.find(listing_id:)
    result = DatabaseConnection.query("SELECT * FROM listings WHERE listing_id = #{listing_id};")
    Listing.new(listing_id: result[0]['listing_id'], name: result[0]['name'],
                free_date: result[0]['free_date'], host_id: result[0]['host_id'],
                price: result[0]['price'], description: result[0]['description'],
                image: result[0]['image'])
  end

end
