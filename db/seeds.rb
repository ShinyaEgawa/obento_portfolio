User.create!(name:  "Example User",
             nickname: "Exampler",
             email: "example@railstutorial.org",
             self_introduction: "Test User",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

9.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               nickname: name,
               self_introduction: name,
               email: email,
               password:              password,
               password_confirmation: password)
end
