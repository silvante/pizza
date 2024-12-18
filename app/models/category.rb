class Category < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true

  def thumbnail
    image.variant(resize_to_limit: [ 50, 50 ])
  end

  has_many :product
end
