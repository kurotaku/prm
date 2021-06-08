# frozen_string_literal: true

class PartnersController < ApplicationController
  def index
    if @current_organization.vendor?
      p @partners = @current_vendor_group.partners.order(created_at: "ASC").decorate
    else
      @partners = Partner.where(parent: @current_organization).order(created_at: "ASC").decorate
    end
  end

  def show
    @partner = Company.find_by(uid: params[:uid]).decorate
    @partners = Company.where(parent: @partner.organization).decorate
  end

  def new
    @partner = Company.new
  end

  def create
    @partner = Company.new(partner_params)
    if @partner.save
      flash[:success] = t("partners.create.success")
      redirect_to partners_path
    else
      flash.now[:danger] = t("partners.create.error")
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def partner_params
      params.require(:company).permit(:name, :address, :parent_id, :hierarchy, :vendor_memo).merge(vendor_group_id: @current_vendor_group.id)
    end
end
