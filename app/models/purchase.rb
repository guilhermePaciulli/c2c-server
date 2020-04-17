class Purchase < ApplicationRecord
  enum purchase_status: [:confirmed, :ready, :in_transit]
  belongs_to :product
  belongs_to :user

  validates_presence_of :user, :product
end
