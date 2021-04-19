class ProductsController < ApplicationController
  def index
    @products = @current_maker_group.products
  end

  def show
    @product = Product.find(params[:id])
  end
end
