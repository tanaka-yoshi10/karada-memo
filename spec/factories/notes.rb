FactoryBot.define do
  factory :note do
    detail '熱が○○度出ている。'
    association :body
  end
end
