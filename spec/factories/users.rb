FactoryBot.define do
  factory :user do
    name "Example"
    nickname "NicknameExample"
    sequence(:email) {|n| "tester#{n}@example.com"}
    password "password"
    password_confirmation "password"
    self_introduction "ExampleTestIntroduction"
    # 有効化
    #activated true
  end
end
