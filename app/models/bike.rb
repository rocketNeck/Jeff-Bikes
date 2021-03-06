class Bike < ApplicationRecord
  belongs_to :user

  has_many :bike_tags, dependent: :destroy
  has_many :tags, through: :bike_tags, dependent: :destroy

  has_many :comments

  validates_presence_of :company, :notice => "Content cannot be blank"

  paginates_per 20

  mount_uploader :photo, PhotoUploader

  def self.search(field, search)
    if search
      where(field.to_sym => search.upcase)
    else
      all
    end
  end

####### overwrite methods to store for search ######
  def company=(c)
    super c.upcase
  end

  def serial_number_1=(s)
    super s.upcase
  end

  def model=(m)
    super m.upcase
  end
######################################

  def first_5_user_bikes
    self.user.bikes.first(5)
  end

  def all_tags=(all_tags)
    all_tags.each do |i, name|
      if name != ""
        t = Tag.where(name: name.strip.upcase).first_or_create!
        self.tags << t
      end
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).bikes
  end
end
