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
end
