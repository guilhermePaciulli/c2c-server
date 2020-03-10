FactoryBot.define do
  factory :product do
    name { Faker::Name.name }
    description  { Faker::Hipster.paragraph }
    price { Faker::Number.decimal(l_digits: 2) }
    picture { Rack::Test::UploadedFile.new('spec/support/fixtures/img.jpg', 'image/jpg') }
  end
end
