FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    nickname { Faker::Internet.username(specifier: 'Test') }
    last_name { Faker::Name.name_with_middle }
    email { Faker::Internet.email }
    password { '12345678' }
    password_confirmation { '12345678' }

    factory :confirmed_user do
      confirmed_at { Time.now } 
    end

    factory :user_without_uid do
      uid { ' ' } 
    end
  end
end
