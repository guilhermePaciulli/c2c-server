class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :email, :name, :surname, :cpf

  attribute :profile_picture_url do |object|
    if Rails.env.test?
      Rails.application.routes.url_helpers.rails_blob_path(object.profile_picture)
    else
      object.profile_picture.service_url
    end
  end

  has_many :products, serializer: ProductSerializer
  has_one :address, serializer: AddressSerializer
  has_one :credit_card, serializer: CreditCardSerializer
end
