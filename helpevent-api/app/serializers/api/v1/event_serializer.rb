class Api::V1::EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :total_price, :event_data
end
