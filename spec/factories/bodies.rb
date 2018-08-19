FactoryBot.define do
  factory :body do
    sequence(:nickname) { |n| "からだ#{n}" }
    association :family

    trait :with_notes do
      after(:build) do |body|
        body.notes << build_list(:note, 2)
      end
    end
  end
end
