class EventItem < ApplicationRecord
  belongs_to :event
  belongs_to :item
  
  validates_presence_of :quantities
  validate :verifi_item_exist_on_event, on: :create

  def verifi_item_exist_on_event
    item = EventItem.where(item_id: item_id, event_id: event_id).present?
    return if item == false

    errors.add(:Item, ' já existente no evento!')
  end

  def make_current_total(event_id)
    value_items = []
    event_item = EventItem.where(event_id: event_id)
    event_item.each do |event|
      value_items.push(event.item.value*event.quantities)
    end
    current_total_event = Event.find(event_id)
    current_total_event.update(total: value_items.sum)
  end

  def decrement_current_total(item_id)
    item_current_event = EventItem.find(item_id)
    event_current = Event.find(item_current_event.event_id)
    event_current.update(total: event_current.total - item_current_event.item.value)
  end
end
