class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_secure_password

  validates :username, :first_name, :last_name, presence: true, length: {minimum: 2, maximum: 15}
  validates :username, uniqueness: {message: "already taken"}
end