class Tag < ApplicationRecord
  validates :name,
            presence: true
   
  has_many :bike_tags
  has_many :bikes, through: :bike_tags
end
