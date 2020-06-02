class AddressSerializer
  include FastJsonapi::ObjectSerializer

  attributes :zip_code, :complement, :number

end
