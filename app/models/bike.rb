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
      where(field.to_sym => search)
    else
      all
    end
  end

  def first_5_user_bikes
    self.user.bikes.first(5)
  end

### TODO currently unless every tag.name is filled in on the form
###      we need to fix the valadation or the attribute writer to exclude nil values in the hash

  def all_tags=(all_tags)
    self.tags = all_tags.map do |i, name|
      Tag.where(name: name.strip).first_or_create! unless name == ""
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).bikes
  end
end
