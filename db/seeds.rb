# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = {}
user['password'] = 'asdf'

ActiveRecord::Base.transaction do
  20.times do 
    user['email'] = Faker::Internet.email
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
    listing['guest'] = rand(1..10)
    listing['bedroom'] = rand(1..6)
    listing['baths'] = rand(1..4)
    listing['min_stays'] = rand(1..3)
    listing['price'] = rand(80..500)
    listing['amenities'] = ["Gym","Pets","WiFi","Pool","Kitchen","Doorman","Game" "Consoles","Heating","Parking on Premesis","Toiletires"].sample(rand(1..5))


    listing['user_id'] = uids.sample
# ["House", "Entire Floor", "Condominium", "Villa", "Townhouse", "Castle", "Treehouse", "Igloo", "Yurt", "Cave", "Chalet", "Hut", "Tent", "Other"].sample
    Listing.create(listing)
  end
end

