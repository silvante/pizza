class HomeController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
    @order = Order.find_by(user: current_user, status: "pending")
    @checking_ids = @order.order_products.pluck(:product_id)
  end
end
