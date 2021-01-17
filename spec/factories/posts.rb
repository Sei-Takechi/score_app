FactoryBot.define do
  factory :post do
    content { "MyText" }
    file { "MyString" }
    user { nil }
  end
end
