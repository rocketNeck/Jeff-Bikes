class BikeTag < ApplicationRecord
  belongs_to :bike
  belongs_to :tag
end
