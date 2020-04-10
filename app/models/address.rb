class Address < ApplicationRecord
  validates_presence_of :user_id, :zip_code, :complement
end
