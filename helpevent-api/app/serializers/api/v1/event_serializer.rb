class Api::V1::EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :total_price, :event_data
end
