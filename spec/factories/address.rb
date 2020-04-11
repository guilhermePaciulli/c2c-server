FactoryBot.define do
  factory :address do
    zip_code { Faker::Address.zip_code }
    complement { Faker::Address.secondary_address }
  end
end
