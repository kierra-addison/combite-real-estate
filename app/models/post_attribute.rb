class PostAttribute < ApplicationRecord
  belongs_to :post

  validates :attribute_name, :attribute_value, presence: true
  validates :attribute_name, :attribute_value, length: {minimum: 2, maximum: 50}

  before_save :uppercase_fields

  def uppercase_fields
  	self.attribute_name = attribute_name.upcase
  	self.attribute_value = attribute_value.upcase
  end
end