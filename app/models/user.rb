class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_secure_password

  validates :username, :first_name, :last_name, presence: true, length: {minimum: 2, maximum: 15}
  validates :username, uniqueness: {message: "already taken"}
  validates :password_confirmation, presence: true, if: -> {!password.nil?}
  validates :password, length: {minimum: 8, allow_nil: false}, if: -> {!password.nil?}
  validates :role, presence: true

  before_save :capitalize_fields
  # before_save :downcase_fields
  before_save :downcase_and_replace_space

  def capitalize_fields
    self.first_name = first_name.split.each { |n| 
      n.capitalize! 
    }.join(' ')
    self.last_name = last_name.split.each { |n| 
      n.capitalize! 
    }.join(' ')
  end

  # def downcase_fields
  #   self.username.downcase!
  # end

  def downcase_and_replace_space
    self.username = username.split.each { |n|
      n.downcase!
    }.join('_')
  end
end