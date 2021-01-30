class Accommodation < ApplicationRecord
  belongs_to :user
  has_one :favourite
end
