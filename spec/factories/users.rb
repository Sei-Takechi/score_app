FactoryBot.define do
  factory :user do
    name { "dyurakashi" }
    sequence(:email, "email_1")
    password { "foobar" }
    password_confirmation { "foobar" }
  end
end
