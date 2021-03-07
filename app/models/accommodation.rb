class Accommodation < ApplicationRecord
  belongs_to :user
  has_one :favourite, dependent: :destroy
  has_one_attached :accommodation_pic
end
