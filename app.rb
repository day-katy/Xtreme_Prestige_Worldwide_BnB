require 'sinatra'
require './lib/listing.rb'
require './lib/booking.rb'
require './database_connection_setup'

class XtremeBnB < Sinatra::Base
  get '/' do
    "Hello world!"
  end

  get '/listings' do
    @listings = Listing.all
    erb :index
  end

  get '/book-listing' do
    "Your booking is confirmed"
  end

  run! if app_file == $0

end
