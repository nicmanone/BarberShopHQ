#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

before do
  @barbers = Barber.order "created_at DESC"
end

get '/' do
  erb :index
end

get '/visit' do
  erb :visit
end

post '/visit' do

  @username = params[:username]
  @phone = params[:phone]
  @datetime = params[:datetime]
  @barber = params[:barber]
  @color = params[:color]

  client = Client.new(
    name: @username, 
    phone: @phone, 
    datastamp: @datetime, 
    barber: @barber,
    color: @color)
  client.save!

  erb "<h2>Thanks, you writed!</h2>"

end


