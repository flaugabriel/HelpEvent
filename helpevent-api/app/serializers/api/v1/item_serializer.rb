class Api::V1::ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :location
  has_one :user
end
