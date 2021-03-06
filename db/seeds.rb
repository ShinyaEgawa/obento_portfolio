User.create!(name:  "Example User",
             nickname: "Exampler",
             email: "example@railstutorial.org",
             self_introduction: "Test User",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

9.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               nickname: name,
               self_introduction: name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

# Posts
users = User.order(:created_at).take(3)
3.times do
  content = Faker::Lorem.sentence(3)
  users.each { |user| user.microposts.create!(content: content) }
end

# Relationship
users = User.all
user  = users.first
following = users[2..6]
followers = users[3..9]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
