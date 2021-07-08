# frozen_string_literal: true

class Leads::CsvsController < ApplicationController
  def index
    @csvs = @current_vendor_group.csv_import_histories.where(related_object: :lead).page(params[:page]).per(10)
  end

  def new
    @csv = @current_vendor_group.csv_import_histories.build
  end

  # rubocop:disable Metrics/AbcSize
  def create
    @csv = @current_vendor_group.csv_import_histories.build(csv_params)

    if @csv.valid?
      ApplicationRecord.transaction do
        CsvService::ImportLeadFromCsvService.perform(csv_file: params[:csv_import_history][:csv_file], vendor_group: @csv.vendor_group)
        @csv.save!
      end
      redirect_to leads_csvs_path, success: t("csv_import_histories.create.success")
    else
      flash.now[:danger] = t("csv_import_histories.create.error")
      render :new
    end
  rescue StandardError => e
    redirect_to new_leads_csv_path, alert: e
  end
  # rubocop:enable Metrics/AbcSize

  private
    def csv_params
      params.require(:csv_import_history).permit(:id).merge(related_object: "lead", staff_id: @current_staff.id)
    end
end
