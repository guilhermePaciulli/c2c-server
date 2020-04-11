class AddressSerializer
  include FastJsonapi::ObjectSerializer

  attributes :zip_code, :complement

end
