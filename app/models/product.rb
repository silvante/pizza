class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :category

  def thumbnail
    image.variant(resize_to_limit: [ 100, 100 ])
  end

  def thumbnail380
    image.variant(resize_to_limit: [ 380, 380 ])
  end

  has_many :order_products

  validate :image_validations

  private

  def image_validations
    if image.attached?
      unless image.content_type.in?(%w[image/jpg image/jpeg image/png image/gif image/webp image/bmp image/tiff])
        errors.add(:image, "must be a valid image format")
      end
      if image.byte_size > 5.megabytes
        errors.add(:image, "should be less than 5 MB")
      end
    end
  end
end
