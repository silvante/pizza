class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :mobile, :born_in, status: "haridor" ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :mobile, :born_in ])
  end
end
