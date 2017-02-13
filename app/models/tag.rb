class Tag < ApplicationRecord
  validates_presence_of :name

  has_many :bike_tags
  has_many :bikes, through: :bike_tags
end
