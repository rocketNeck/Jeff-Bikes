class Bike < ApplicationRecord
  belongs_to :user

  validates_presence_of :company, :on => :create, :message => "can't be blank"


  mount_uploader :photo, PhotoUploader

end
