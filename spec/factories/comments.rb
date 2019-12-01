FactoryBot.define do
  factory :comment, class: Comment do
    association :user, factory: :user
    association :micropost, factory: :micropost
    body "ExampleText"
  end
end
