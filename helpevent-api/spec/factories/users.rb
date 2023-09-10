FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    nickname { Faker::Internet.username }
    last_name { Faker::Name.name_with_middle }
    email { Faker::Internet.email }
    password { '12345678' }
    password_confirmation { '12345678' }

    trait :with_invalid_attributes do
      email { nil } 
      nickname { nil } 
    end

    trait :confirmed_user do
      confirmed_at { Time.now } 
    end

    factory :user_with_events do
      transient do 
        events_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:event, evaluator.events_count, user: user)
      end
    end
  end
end
