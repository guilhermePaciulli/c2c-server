class User < ApplicationRecord
  has_one_attached :profile_picture
  has_one :credit_card, dependent: :destroy, foreign_key: :user_id
  has_one :address, dependent: :destroy, foreign_key: :user_id
  has_many :products, dependent: :destroy, foreign_key: :owner
  has_many :purchases, dependent: :destroy

  has_secure_password
  validates_presence_of :email, :name, :surname, :cpf, :password_digest, :profile_picture
  validates_uniqueness_of :email, :cpf
  validates :password, length: { in: 8..20 }
end
