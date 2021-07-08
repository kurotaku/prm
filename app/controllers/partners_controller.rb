# frozen_string_literal: true

class PartnersController < ApplicationController
  before_action :set_partner, only: %i[show edit update destroy]

  def index
    @partners = if @current_organization.vendor?
      @current_vendor_group.partners.order(created_at: "DESC").page(params[:page]).per(10).decorate
    else
      Partner.where(parent: @current_organization).order(created_at: "ASC").decorate
    end
    @index_columns = index_column("company")
  end

  def show
    # @partners = Company.where(parent: @partner.organization).decorate
    @leads = @partner.leads.decorate.limit(5)
    @lead_index_columns = index_column("lead")
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

  def edit; end

  def update
    if @partner.update(partner_params)
      flash[:success] = t("partners.update.success")
      redirect_to partner_path(uid: @partner.uid)
    else
      flash.now[:danger] = t("partners.update.error")
      render :edit
    end
  end

  def destroy
    @partner.destroy

    flash[:success] = t("partners.destroy.success")
    redirect_to partners_path
  end

  private
    def set_partner
      @partner = Company.find_by(uid: params[:uid]).decorate
    end

    def partner_params
      params.require(:company).permit(Product.column_names.map { |c| c.to_sym }).merge(vendor_group_id: @current_vendor_group.id)
    end
end
