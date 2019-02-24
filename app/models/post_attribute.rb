class PostAttribute < ApplicationRecord
  belongs_to :post

  validates :attribute_name, :attribute_value, presence: true
  validates :attribute_name, :attribute_value, length: {minimum: 2, maximum: 50}
end