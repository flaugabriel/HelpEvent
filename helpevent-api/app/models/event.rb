class Event < ApplicationRecord
  has_many :event_users
  belongs_to :user

  validates :title, presence: true, length: { maximum: 50, minimum: 3 }, uniqueness: { case_sensitive: false }
  validates :total_price, presence: true
  validates_presence_of :event_data
  
  def get_item_not_inclued(event_id,current_user)
    item_array = []
    event_items = Event.new.select_item_by_events(event_id)
    event_items.each do |item|
      item_array << item.item_id
    end
    Item.where(user_id: current_user).where.not(id: item_array)
  end

  def select_item_by_events(event_id)
    EventItem.where(event_id: event_id)
  end

  def delete_event_by_admin(id)
    event_item = EventItem.where(event_id: id)
    event_item.delete_all
    event_user = EventUser.where(event_id: id)
    event_user.delete_all
  end

  def event_create
    t = Event.last
    user_events = EventUser.where(event_id: t.id)
    if user_events.present?
      return true
    else
      EventUser.create(event_id: t.id, user_id: t.user_id)
    end
  end
end
