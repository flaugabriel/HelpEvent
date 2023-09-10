FactoryBot.define do
  factory :event_item do
    status { 1 }
    quantities { 1 }
    event { nil }
    item { nil }
  end
end
