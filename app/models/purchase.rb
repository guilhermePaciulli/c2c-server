class Purchase < ApplicationRecord
  enum purchase_status: [:waiting, :confirmed, :in_transit, :received]
  belongs_to :product
  belongs_to :user

  validates_presence_of :user, :product

  def next_purchase_status
    case purchase_status
    when "waiting"
      return "confirmed"
    when "confimed"
      return "in_transit"
    when "in_transit"
      return "received"
    end
    save!
  end
end
