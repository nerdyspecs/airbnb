# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['email'] = Faker::Internet.email
    user['name'] = Faker::Ancient.god
    User.create(user)
  end
end 

listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['title'] = Faker::App.name
    listing['address'] = Faker::Address.street_address
    listing['city'] = Faker::Address.city
    listing['guest'] = rand(1..10)
    listing['bedroom'] = rand(1..6)
    listing['baths'] = rand(1..4)
    listing['min_stays'] = rand(1..3)
    listing['price'] = rand(80..500)
    listing['amenities'] = ["Gym","Pets","WiFi","Pool","Kitchen","Doorman","Game" "Consoles","Heating","Parking on Premesis","Toiletires"].sample(rand(1..5))
    listing['description'] = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"

    listing['user_id'] = uids.sample
# ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    Listing.create(listing)
  end
end

