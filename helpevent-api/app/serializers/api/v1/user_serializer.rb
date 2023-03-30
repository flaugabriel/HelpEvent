class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :email, :nickname
end
