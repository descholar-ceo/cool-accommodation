# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 ## Initialize first accommodation:
 Accommodation.create! do |acc|
  acc.name           = 'neza motel'
  acc.price          = 1509.99
  acc.description    = 'Your holiday is taken into account'
  acc.user           = User.first
end

 ## Initialize first accommodation:
Accommodation.create! do |acc|
  acc.name           = 'neza guest house'
  acc.price          = 1299.99
  acc.description    = 'Cool place to stay while in your holiday, it\'s near the lake Kivu'
  acc.user           = User.first
end

## Initialize first fovourite:
Favourite.create! do |fav|
  fav.user             = User.first
  fav.accommodation          = Accommodation.first
end
