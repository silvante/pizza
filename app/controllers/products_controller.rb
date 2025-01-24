class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @related_products = Product.where(category: @product.category)
  end
end
