FactoryBot.define do
  factory :address do
    zip_code { Faker::Address.zip_code }
    complement { Faker::Address.secondary_address }
    number { Faker::Address.building_number }
  end
end
