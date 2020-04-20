class Product < ApplicationRecord
  has_one_attached :picture
  belongs_to :user, foreign_key: :owner
  has_many :purchases

  validates_presence_of :name, :description, :price, :picture, :owner
  validates :price, numericality: { greater_than: 0 }

end
