class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :users_id, :zip_code, :complement
end
