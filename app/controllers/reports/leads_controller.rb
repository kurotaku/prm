# frozen_string_literal: true

class Reports::LeadsController < ApplicationController
  # rubocop:disable Metrics/AbcSize
  def index
    @leads = @current_vendor_group.leads.order(created_at: "DESC").page(params[:page]).per(10).decorate
    if params[:company_id].present?
      @leads = @leads.where(company_id: params[:company_id])
      params[:page] = ""
    end
    if params[:staff_id].present?
      @leads = @leads.where(staff_id: params[:staff_id])
      params[:page] = ""
    end
    if params[:product_id].present?
      @leads = @leads.where(product_id: params[:product_id])
      params[:page] = ""
    end
    if params[:lead_phase_id].present?
      @leads = @leads.where(lead_phase_id: params[:lead_phase_id])
      params[:page] = ""
    end
  end
  # rubocop:enable Metrics/AbcSize
end
