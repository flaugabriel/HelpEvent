FactoryBot.define do
  factory :event do
    title { Faker::Lorem.sentence }
    total_price { Faker::Commerce.price(range: 0..10000) }
    event_data { Faker::Date.between_except(from: 5.year.ago, to: 1.year.from_now, excepted: Date.today) }

    factory :invalid_event do
      title { nil } 
    end
  end
end
