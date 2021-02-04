  require './lib/database_connection'
  require 'pg'

class Listing

  attr_reader :id, :name, :free_date, :host_id

  def initialize(id:, name:, free_date:, host_id:)
    @id = id
    @name = name
    @free_date = free_date
    @host_id = host_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM listings;")

    result.map do |listing|
      Listing.new(id: listing['id'], name: listing['name'], free_date: listing['free_date'], host_id: listing['host_id'])
    end

  end

  def self.create(name:, free_date:)
    result = DatabaseConnection.query("INSERT INTO listings (name, free_date)
    VALUES ('#{name}', '#{free_date}')
    RETURNING id, name, free_date, host_id;")

    Listing.new(id: result[0]['id'], name: result[0]['name'], free_date: result[0]['free_date'], host_id: result[0]['host_id'])

  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM listings WHERE id = #{id};")
    Listing.new(id: result[0]['id'], name: result[0]['name'], free_date: result[0]['free_date'], host_id: result[0]['host_id'])

  end

end
