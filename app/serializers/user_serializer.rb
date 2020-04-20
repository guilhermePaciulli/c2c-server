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

  attribute :purchases do |user|
    BuyerSerializer.new(user.purchases).serializable_hash
  end
  attribute :credit_card, if: Proc.new { |user|
    user.credit_card.present?
  }
  attribute :address, if: Proc.new { |user|
    user.address.present?
  }
end
