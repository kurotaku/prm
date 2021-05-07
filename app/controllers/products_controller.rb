# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = @current_maker_group.products
  end

  def show
    @product = Product.find_by(uid: params[:uid])
  end
end
