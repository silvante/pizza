class Category < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true
end
