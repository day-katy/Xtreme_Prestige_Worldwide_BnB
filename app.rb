require 'sinatra'
require 'listing'
require './database_connection_setup'
require 'users'
require 'bcrypt'

class XtremeBnB < Sinatra::Base
  enable :sessions

  get '/' do
    "Hello world!"
  end

  get '/listings' do
    @user = Users.find(session[:user_id])
    @listings = Listing.all
    erb :index
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    @user = Users.create(name: params[:name], email: params[:email], password: params[:password])
    redirect '/listings'
  end

  run! if app_file == $0

end
