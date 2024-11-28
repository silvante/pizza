class OrdersController < ApplicationController
  def destroy
    @order = Order.find(params[:id])
    @order.order_products.destroy_all
    @order.destroy!
    respond_to do |format|
      format.html { redirect_to cart_index_path, status: :see_other, notice: "Savatcha tozalandi" }
      format.json { head :no_content }
    end
  end

  private

  # def set_order
  #   @order = Order.find(params[:id])
  # end
end
