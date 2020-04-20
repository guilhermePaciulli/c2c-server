class SellerSerializer
  include FastJsonapi::ObjectSerializer

  attributes :purchase_status
  attribute :product do |purchase|
    ProductSerializer.new(purchase.product).serializable_hash
  end
  attribute :address do |purchase|
    purchase.address
  end

end
