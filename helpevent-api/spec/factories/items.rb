FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 0..999) }
    location { Faker::Address.full_address }
    user
  end
end
