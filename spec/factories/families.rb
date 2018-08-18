FactoryBot.define do
  factory :family do

    trait :with_members do
      after(:build) do |family|
        family.members << build_list(:member, 2)
      end
    end
  end
end
