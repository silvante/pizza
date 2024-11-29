class DeliveryController < ApplicationController
  layout "delivery"
  def show
    @delivery = User.find(params[:id])
  end
end
