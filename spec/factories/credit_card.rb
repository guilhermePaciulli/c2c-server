FactoryBot.define do
  factory :credit_card do
    number { Faker::Finance.credit_card }
    cvv  { Faker::Finance.vat_number }
    owner { Faker::Name.name }
    expiration { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end
