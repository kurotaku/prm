# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = @current_vendor_group.products.order(created_at: "DESC").page(params[:page]).per(10).decorate
    @index_columns = index_column("product")
  end

  def new
    @product = @current_vendor_group.products.build
  end

  def create
    @product = @current_vendor_group.products.build(product_params)
    if @product.save
      flash[:success] = t(".success")
      redirect_to products_path
    else
      flash.now[:error] = t(".error")
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @product.update(product_params)
      flash[:success] = t(".success")
      redirect_to product_path(uid: @product.uid)
    else
      flash.now[:danger] = t(".error")
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_path, notice: t(".success")
    else
      flash.now[:danger] = t(".error")
      render :show
    end
  end

  private
    def set_product
      @product = Product.find_by(uid: params[:uid]).decorate
    end

    def product_params
      params.require(:product).permit(Product.column_names.map { |c| c.to_sym }).merge(vendor_group_id: @current_vendor_group.id)
    end
end
