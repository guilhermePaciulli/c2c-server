class Address < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  validates_presence_of :zip_code, :complement, :user_id, :number
end
