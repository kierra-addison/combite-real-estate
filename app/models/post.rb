class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :title_image
  has_many_attached :post_images
end
