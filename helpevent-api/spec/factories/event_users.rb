FactoryBot.define do
  factory :event_user do
    admin { false }
    event { nil }
    user { nil }

    trait :as_admin do
      admin { true } 
    end
  end
end
