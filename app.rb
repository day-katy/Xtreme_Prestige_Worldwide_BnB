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
    @user = Users.find(user_id: session[:user_id])
    @listings = Listing.all
    erb :index
  end

  get '/listing/new' do
    erb :'listing/new'
  end

  post '/listings/confirmation' do
    new_listing = Listing.create(name: params[:name], free_date: params[:free_date], host_id: session[:user_id])
    session[:new_listing_id] = new_listing.listing_id
    session[:host_id] = session[:user_id]
    redirect '/listings/confirmation'
  end

  get '/listings/confirmation' do
    @listing = Listing.find(listing_id: session[:new_listing_id])
    erb :"listing/confirmation"
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = Users.create(name: params['name'], email: params['email'], password: params['password'])
    session[:user_id] = user.user_id
    redirect '/listings'
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = Users.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.user_id
      redirect '/listings'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/new'
    end
  end

  post '/book-listing/:listing_id' do
    p "AAAAAAH!"
    p params 
    listing = Listing.find(listing_id: params[:listing_id])
    p "OHMYGOOOOODNESS"
    p params
    session[:listing_id] = params[:listing_id]
    new_booking = Booking.create(user_id: session[:user_id], listing_id: session[:listing_id], date: listing.free_date)

    session[:new_booking_id] = new_booking.booking_id
    redirect '/booking/confirmation'
  end

  get '/booking/confirmation' do
    @listing = Listing.find(listing_id: session[:listing_id])
    erb :"booking/booking_confirmation"
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/listings')
  end

  run! if app_file == $0

end
