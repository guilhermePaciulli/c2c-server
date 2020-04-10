FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    surname  { Faker::Name.name }
    cpf { Faker::Name.name }
    email { Faker::Internet.email }
    password { "foobarfoobar" }
    profile_picture { Rack::Test::UploadedFile.new('spec/support/fixtures/img.jpg', 'image/jpg') }
  end
end
