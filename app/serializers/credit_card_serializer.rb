class CreditCardSerializer
  include FastJsonapi::ObjectSerializer

  attributes :number, :owner, :cvv, :expiration

  attribute :number do |object|
    number = object.number
    last_digits = number.to_s.length <= 4 ? number : number.to_s.slice(-4..-1)
    object.number = "************#{last_digits}"
  end

  attribute :cvv do |object|
    "***"
  end
end
