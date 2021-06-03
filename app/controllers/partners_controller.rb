# frozen_string_literal: true

class PartnersController < ApplicationController
  def index
    if @current_company.maker?
      @partners = @current_vendor_group.partners.order(created_at: "ASC").decorate
    else
      @partners = Partner.where(parent: @current_company).order(created_at: "ASC").decorate
    end
  end

  def show
    @partner = Partner.find_by(uid: params[:uid]).decorate
    @partners = Partner.where(parent: @partner.company).decorate
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      flash[:success] = t('partners.create.success')
      redirect_to partners_path
    else
      flash.now[:danger] = t('partners.create.error')
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
      params.require(:partner).permit(:name, :address, :parent_id, :hierarchy, :vendor_memo).merge(vendor_group_id: @current_vendor_group.id)
    end
end
