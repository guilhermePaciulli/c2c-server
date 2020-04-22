class BuyerSerializer
  include FastJsonapi::ObjectSerializer

  attributes :purchase_status
  attribute :product do |purchase|
    ProductSerializer.new(purchase.product).serializable_hash
  end
  attribute :address do |purchase|
    purchase.address
  end
  attribute :credit_card do |purchase|
    purchase.credit_card
  end
end
