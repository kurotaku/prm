# frozen_string_literal: true

class Reports::PartnersController < ApplicationController
  def index
    # @partners = @current_vendor_group.partners.order(created_at: "DESC").page(params[:page]).per(10).decorate
    @q = @current_vendor_group.partners.ransack(params[:q])
    @q.sorts = ["sales_price_amount desc"] if @q.sorts.empty?
    @partners = @q.result.decorate
  end
end
