FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    surname  { Faker::Name.name }
    cpf { Faker::Name.name }
    email { Faker::Internet.email }
    password { "foobar" }
  end
end
