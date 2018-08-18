FactoryBot.define do
  factory :family do

    trait :with_members do
      after(:build) do |family|
        family.members << build_list(:member, 2)
      end
    end

    trait :with_bodies do
      after(:build) do |family|
        family.bodies << build_list(:body, 2)
      end
    end
  end
end
