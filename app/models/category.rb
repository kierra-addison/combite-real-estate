class Category < ApplicationRecord
  has_many :post_categories, dependent: :destroy
  has_many :posts, through: :post_categories

  validates :category_name, :category_description, presence: true
  validates :category_name, length: {minimum: 2, maximum: 15}
  validates :category_description, length: {minimum: 10, maximum: 100}

  before_save :capitalize_fields

  default_scope { order(created_at: :asc) }

  def capitalize_fields
    self.category_name = category_name.split.each { |w|
                            w.capitalize!
                          }.join(' ')
    end
end