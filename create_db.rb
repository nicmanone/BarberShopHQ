# create_db.rb
require './app'
ActiveRecord::Base.connection
puts "Database created: barbershop.db"
