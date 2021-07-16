class Accommodation < ApplicationRecord
  belongs_to :user
  has_one :favourite, dependent: :destroy
end
