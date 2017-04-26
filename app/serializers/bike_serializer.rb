class BikeSerializer < ActiveModel::Serializer
  attributes :id, :company
  belongs_to :user
end
