class CreditCardSerializer
  include FastJsonapi::ObjectSerializer

  attributes :number, :owner, :cvv, :expiration

end
