  require './lib/database_connection'
  require 'pg'

class Listing

  attr_reader :id, :name, :free_date

  def initialize(id:, name:, free_date:)
    @id = id
    @name = name
    @free_date = free_date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM listings;")

    result.map do |listing|
      Listing.new(id: listing['id'], name: listing['name'], free_date: listing['free_date'])
    end

  end

end
