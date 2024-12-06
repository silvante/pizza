class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :categories
  helper_method :cart_total_price
  helper_method :checking_ids
  helper_method :delivery_workers

  def categories
    Category.all
  end

  def cart_total_price
    @order = Order.find_by(user: current_user, status: "pending")
    if @order.present?
      @order.order_products.sum { |op| op.amount * op.product.price }
    end
  end

  def checking_ids
    @order = Order.find_by(user: current_user, status: "pending")
    if @order.present?
      @checking_ids = @order.order_products.pluck(:product_id)
    end
  end

  def delivery_workers
    User.where(status: "delivery")
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :mobile, :born_in, status: "haridor" ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :mobile, :born_in ])
  end

  def authenticate_admin!
    authenticate_user!
    unless current_user.status == "admin"
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end
  end

  def authenticate_delivery!
    authenticate_user!
    unless current_user.status == "delivery"
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end
  end

  def authenticate_client!
    authenticate_user!
    unless current_user.status == "client"
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end
  end
end
