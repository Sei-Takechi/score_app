User.create!(name: "ando",
             email: "ando@gmail.com",
             password: "andoando",
             password_confirmation: "andoando")

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password,
               password_confirmation: password)
end