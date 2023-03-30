FactoryBot.define do
  factory :item do
    name { "MyString" }
    price { "9.99" }
    location { "MyString" }
    user { nil }
  end
end
