# frozen_string_literal: true

class LeadsController < ApplicationController
  before_action :set_lead, only: %i[show edit update destroy]

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def index
    @all_leads = @current_vendor_group.leads.order(created_at: "DESC")
    if params[:company_id].present?
      @all_leads = @all_leads.where(company_id: params[:company_id])
      params[:page] = ""
    end
    if params[:staff_id].present?
      @all_leads = @all_leads.where(staff_id: params[:staff_id])
      params[:page] = ""
    end
    if params[:product_id].present?
      @all_leads = @all_leads.where(product_id: params[:product_id])
      params[:page] = ""
    end
    if params[:lead_phase_id].present?
      @all_leads = @all_leads.where(lead_phase_id: params[:lead_phase_id])
      params[:page] = ""
    end

    @leads = @all_leads.page(params[:page]).per(10).decorate

    @index_columns = index_column("lead")
    respond_to do |format|
      format.html
      format.csv do
        export_csv @index_columns, @all_leads
      end
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def show; end

  def new
    @lead = @current_vendor_group.leads.build
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      # Notification.create!(GenerateNotificationParamService.create_notification_for_vendor(@lead, current_user))

      flash[:success] = t(".success")
      redirect_to leads_path
    else
      flash.now[:danger] = t(".error")
      render :new
    end
  end

  def edit; end

  def update
    if @lead.update(lead_params)
      flash[:success] = t(".success")
      redirect_to lead_path(uid: @lead.uid)
    else
      flash.now[:danger] = t(".error")
      render :edit
    end
  end

  def destroy
    if @lead.destroy
      redirect_to leads_path, notice: t(".success")
    else
      flash.now[:danger] = t(".error")
      render :show
    end
  end

  private
    def set_lead
      @lead = Lead.find_by(uid: params[:uid]).decorate
    end

    def lead_params
      params.require(:lead).permit(Lead.column_names.map { |c| c.to_sym }).merge(vendor_group_id: @current_vendor_group.id)
    end

    def export_csv(index_columns, leads)
      csv_data = CsvService::GenerateCsvDataService.perform(index_columns, leads)
      file_name = "leads_#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.csv"

      send_data(csv_data, filename: file_name, type: :csv)
    end
end
