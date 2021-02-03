require_relative './lib/users'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/listing.rb'
require './lib/booking.rb'
require './database_connection_setup'

class XtremeBnB < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/listings'
  end

  get '/listings' do
    @user = Users.find(id: session[:user_id])
    @listings = Listing.all
    erb :index
  end

  get '/listing/new' do
    erb :'listing/new'
  end

  post '/listings/confirmation' do
    # @user = Users.find(id: session[:user_id])
    @new_listing = Listing.create(name: params[:name], free_date: params[:free_date])
    session[:listing_id] = @new_listing.id
    redirect '/listings/confirmation'
  end

  get '/listings/confirmation' do
    erb :"listing/confirmation"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = Users.create(name: params['name'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/listings'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = Users.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/listings'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/new'
    end
  end

  get '/book-listing' do
    "Your booking is confirmed"
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/listings')
  end
  run! if app_file == $0

end
