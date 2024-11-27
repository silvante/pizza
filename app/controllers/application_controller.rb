class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :categories
  helper_method :cart_total_price

  def categories
    Category.all
  end

  def cart_total_price
    @order = Order.find_by(user: current_user, status: "pending")
    @order.order_products.sum { |op| op.amount * op.product.price }
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :mobile, :born_in, status: "haridor" ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :mobile, :born_in ])
  end
end
