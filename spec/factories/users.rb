FactoryBot.define do
  factory :user do
    sequence(:name) {|n| "User#{n}"}
    sequence(:nickname) {|n| "NickName#{n}"}
    sequence(:email) {|n| "tester#{n}@example.com"}
    password  {"password"}
    password_confirmation {"password"}
    sequence(:self_introduction) {"ExampleTestIntroduction"}
  end
end
