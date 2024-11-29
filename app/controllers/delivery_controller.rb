class DeliveryController < ApplicationController
  before_action :authenticate_delivery!
  layout "delivery"
  def show
    @delivery = User.find(params[:id])
  end
end
