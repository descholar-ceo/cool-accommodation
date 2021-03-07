# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## Initialize first account:
User.create(email: 'sample@user.com', password: 'sample')

 ## Initialize first accommodation:
 Accommodation.create([
   { name: 'neza motel', price: 1499.99, description: 'Your holiday is taken into account', user: User.first },
   { name: 'neza guest house', price: 1299.99, description: 'Your rest is our priority', user: User.first },
   { name: 'neza rest home', price: 1899.99, description: 'This place feels like your real home', user: User.first },
   { name: 'neza sample', price: 1399.99, description: 'This place feels like your real home', user: User.first },
   { name: 'neza user peace', price: 1099.99, description: 'This place feels like your real home', user: User.first },
   { name: 'neza peace house', price: 1599.99, description: 'This place feels like your real home', user: User.first },
   { name: 'neza house peace', price: 1399.99, description: 'This place feels like your real home', user: User.first },
   { name: 'neza welcome home', price: 1199.99, description: 'This place feels like your real home', user: User.first },
   { name: 'neza people\'s home', price: 1799.99, description: 'This place feels like your real home', user: User.first },
   { name: 'neza tourist home', price: 2999.99, description: 'This place feels like your real home', user: User.first },
                      ])

## Initialize first fovourite:
Favourite.create([
  { user: User.first, accommodation: Accommodation.first},
  { user: User.first, accommodation: Accommodation.last},
                ])
