class ProductSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :description, :price

  attribute :product_image_url do |object|
    object.picture.service_url
  end
end
