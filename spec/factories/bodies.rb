FactoryBot.define do
  factory :body do
    sequence(:nickname) { |n| "からだ#{n}" }
    association :family
  end
end
