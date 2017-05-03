class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :image
  has_many :bikes
end
