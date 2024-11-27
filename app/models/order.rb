class Order < ApplicationRecord
  before_create :generate_order_code
  belongs_to :user

  has_many :order_products

  def generate_order_code
    loop do
      self.order_code = SecureRandom.random_number(1_000_000).to_s.rjust(6, "0")
      break unless Order.exists?(order_code: order_code)
    end
  end
end
