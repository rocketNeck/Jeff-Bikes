class Bike < ApplicationRecord
  belongs_to :user

  has_many :bike_tags
  has_many :tags, through: :bike_tags

  validates_presence_of :company, :on => :create, :message => "can't be blank"


  mount_uploader :photo, PhotoUploader

end
