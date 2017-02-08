class Tag < ApplicationRecord
  validates_presence_of :name, :notice => "Content cannot be blank"

  has_many :bike_tags
  has_many :bikes, through: :bike_tags
end
