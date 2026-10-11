#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

class Client < ActiveRecord::Base
  validates :name, presence: true
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


  c = Client.new params[:client]
  c.save

  erb "<h2>Thanks, you writed!</h2>"

end



