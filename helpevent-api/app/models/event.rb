class Event < ApplicationRecord
  has_many :event_users
  accepts_nested_attributes_for :event_users, allow_destroy: true
end
