class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email, :name, :surname, :cpf, :password_digest
  validates_uniqueness_of :email
end
