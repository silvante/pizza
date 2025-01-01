class Category < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true

  def thumbnail
    image.variant(resize_to_limit: [ 50, 50 ])
  end

  has_many :product, dependent: :destroy

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
