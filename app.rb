require 'sinatra'
require 'listing'
require './database_connection_setup'

class XtremeBnB < Sinatra::Base
  get '/' do
    "Hello world!"
  end

  get '/listings' do
    @listings = Listing.all
    erb :index
  end

  run! if app_file == $0

end
