class PartnersController < ApplicationController
  def index
    @partners = Partner.where(parent: @current_company)
  end

  def show
    @partner = Partner.find(params[:id])
    @partners = Partner.where(parent: @partner.company)
  end
end
