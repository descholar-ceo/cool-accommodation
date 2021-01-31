class User < ApplicationRecord
  # password encryption
  has_secure_password

  # validations
  validates :username, presence: true, uniqueness: true, length: { in: 3..50 }
  validates :email, presence: true, uniqueness: true, length: { in: 3..50 }
  validates :password, presence: true, length: { in: 3..50 }

  # associations
  has_many :accommodations
  has_many :favourites
end
