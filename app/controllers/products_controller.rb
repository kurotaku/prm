# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = @current_vendor_group.products.all.order(created_at: "DESC").page(params[:page]).per(10).decorate
  end

  def new
    @product = @current_vendor_group.products.build
  end

  def create
    @product = @current_vendor_group.products.build(product_params)
    if @product.save
      flash[:success] = t("products.create.success")
      redirect_to products_path
    else
      flash.now[:error] = t("products.create.error")
      render :new
    end
  end

  def show; end


  def edit; end

  def update
    if @product.update(product_params)
      flash[:success] = t("products.update.success")
      redirect_to product_path(uid: @product.uid)
    else
      flash.now[:danger] = t("products.update.error")
      render :edit
    end
  end

  def destroy
  end

  private
    def set_product
      @product = Product.find_by(uid: params[:uid]).decorate
    end

    def product_params
      params.require(:product).permit(:vendor_group, :code, :name, :image, :agency_price, :agency_incentive, :agency_description, :introduction_price,
:introduction_incentive, :introduction_description, :wholesale_price, :wholesale_description)
    end
end
