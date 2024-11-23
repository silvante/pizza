class Category < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true

  def thumbnail
    image.variant(resize_to_limit: [ 100, 100 ])
  end
end
