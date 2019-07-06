class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  has_many :post_attributes, dependent: :destroy
  has_many :post_categories, dependent: :destroy
  has_many :categories, through: :post_categories
  has_one_attached :title_image
  has_many_attached :post_images

  scope :order_descending, -> { order(created_at: :desc) }

  validates :title, :description, :google_map_embed, presence: true
  validates :title, length: {minimum: 5, maximum: 50}
  validates :google_map_embed, length: {minimum: 130, maximum: 500}
  validates :description, length: {minimum: 50, maximum: 5000}
  validates :title_image, attached: true, 
                          content_type: {in: [
                                                'image/png', 
                                                'image/jpg', 
                                                'image/jpeg'
                                              ], message: 'must be JPEG or PNG'} 
                          # dimension: { width: { min: 800, max: 2400 },
                          #             height: { min: 600, max: 1800 }, 
                          #             message: 'is not given between landscape dimension' }
  validates :post_images, content_type: {in: [
                                                'image/png', 
                                                'image/jpg', 
                                                'image/jpeg'
                                              ], message: 'must be JPEG or PNG'}
                          # dimension: { width: { min: 800, max: 2400 },
                          #             height: { min: 600, max: 1800 }, 
                          #             message: 'is not given between landscape dimension' }

  before_save :capitalize_fields

  private
    def capitalize_fields
      self.title = title.split.each { |w|
                      w.capitalize!
                    }.join(' ')
    end
end
