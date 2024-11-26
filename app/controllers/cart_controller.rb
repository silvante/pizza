class CartController < ApplicationController
  before_action :authenticate_user!
  def index
    @order = Order.find_by(user: current_user, status: "pending")
  end

  def add_to_cart
    @order = Order.find_or_create_by(user: current_user, status: "pending")
    @product = Product.find(params[:product_id])
    order_product = @order.order_products.find_or_initialize_by(product: @product)

    order_product.amount = (@order_product.amount || 0) + params[:amount].to_i
    if order_product.save
      @order.update(total: @order.order_products.sum(:amount))
      redirect_to cart_index_path, notice: "product added successfully"
    else
      redirect_back fallback_location: root_path, alert: "Failed to add product to cart."
    end
  end
end
