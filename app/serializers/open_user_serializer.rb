class OpenUserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :surname

  attribute :profile_picture_url do |object|
    if Rails.env.test?
      Rails.application.routes.url_helpers.rails_blob_path(object.profile_picture)
    else
      object.profile_picture.service_url
    end
  end

end
