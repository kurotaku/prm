# frozen_string_literal: true

class ContractsController < ApplicationController
  before_action :set_contract, only: %i[show edit update destroy]
  before_action :set_relation, only: %i[new create]

  def index
    @contracts = @current_vendor_group.contracts.order(created_at: "DESC").page(params[:page]).per(10).decorate
    @partners = @current_vendor_group.partners
    @products = @current_vendor_group.products

    @index_columns = index_column("contract")
  end

  def show; end

  def new
    @contract = @current_vendor_group.contracts.build
  end

  def create
    @contract = @current_vendor_group.contracts.build(contract_params)
    if @contract.save
      flash[:success] = t(".success")
      redirect_to contracts_path
    else
      flash.now[:danger] = t(".error")
      render :new
    end
  end

  def edit; end

  def update
    if @contract.update(contract_params)
      flash[:success] = t(".success")
      redirect_to contract_path(uid: @contract.uid)
    else
      flash.now[:danger] = t(".error")
      render :edit
    end
  end

  def destroy
    if @contract.destroy
      redirect_to contracts_path, notice: t(".success")
    else
      flash.now[:danger] = t(".error")
      render :show
    end
  end

  private
    def set_contract
      @contract = Contract.find_by(uid: params[:uid]).decorate
    end

    def set_relation
      @partner = Company.find_by(uid: params[:company_uid])
      @product = Product.find_by(uid: params[:product_uid])
    end

    def contract_params
      params.require(:contract).permit(Contract.column_names.map { |c| c.to_sym }).merge(vendor_group_id: @current_vendor_group.id)
    end
end
