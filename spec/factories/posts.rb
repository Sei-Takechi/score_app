FactoryBot.define do
  factory :post do
    sequence(:id, 1)
    content { "MyText" }
    file { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'sample.pdf')) }
    user_id { 1 }
  end
end
