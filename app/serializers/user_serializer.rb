class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname, :image, :email
  has_many :bikes
end
