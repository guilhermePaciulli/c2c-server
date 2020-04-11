class CreditCard < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  validates_presence_of :owner, :cvv, :number, :expiration, :user_id
end
