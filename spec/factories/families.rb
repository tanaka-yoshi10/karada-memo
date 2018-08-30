FactoryBot.define do
  factory :family do
    trait :with_members do
      transient do
        member_count 5
      end

      after(:build) do |family, evaluator|
        family.members << build_list(:member, evaluator.member_count)
      end
    end

    trait :with_bodies do
      transient do
        body_count 5
      end

      after(:build) do |family, evaluator|
        family.bodies << build_list(:body, evaluator.body_count)
      end
    end
  end
end
