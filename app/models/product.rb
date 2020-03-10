class Product < ApplicationRecord
  has_one_attached :picture

  validates_presence_of :name, :description, :price, :picture
  validates :price, numericality: { greater_than: 0 }

end
