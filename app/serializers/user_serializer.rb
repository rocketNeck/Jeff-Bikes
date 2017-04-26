class UserSerializer < ActiveModel::Serializer
  attributes :id, :fullname
  has_many :bikes
end
