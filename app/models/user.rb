class User < ApplicationRecord
  has_secure_password

  has_many :accommodations
  has_many :favourites
end
