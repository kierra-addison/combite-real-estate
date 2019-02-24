class Post < ApplicationRecord
  belongs_to :user
  has_many :post_attributes
  has_one_attached :title_image
  has_many_attached :post_images

  validates :title, :description, presence: true
  validates :title, length: {minimum: 5, maximum: 50}
  validates :description, length: {minimum: 50, maximum: 5000}
  validates :title_image, attached: true, content_type: { in: [
                                                                'image/png', 
                                                                'image/jpg', 
                                                                'image/jpeg'
                                                              ], message: 'must be JPEG or PNG' }
  validates :post_images, content_type: {in: [
                                                'image/png', 
                                                'image/jpg', 
                                                'image/jpeg'
                                              ], message: 'must be JPEG or PNG'}

  before_save :capitalize_fields

  def capitalize_fields
    self.title = title.split.each { |w|
                    w.capitalize!
                  }.join(' ')
  end
end
