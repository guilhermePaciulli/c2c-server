class ProductSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :description, :price, :owner

  attribute :product_image_url do |object|
    if Rails.env.test?
      Rails.application.routes.url_helpers.rails_blob_path(object.picture)
    else
      object.picture.service_url
    end
  end

end
