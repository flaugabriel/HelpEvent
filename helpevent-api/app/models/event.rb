class Event < ApplicationRecord
  has_many :event_users
  # accepts_nested_attributes_for :event_users, allow_destroy: true

  validates :title, presence: true, length:{maximum: 50, minimum: 3}, uniqueness: { case_sensitive: false }
end
