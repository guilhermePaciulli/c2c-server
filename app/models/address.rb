class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :zip_code, :complement, :users_id
end
