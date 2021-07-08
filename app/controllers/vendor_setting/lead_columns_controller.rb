# frozen_string_literal: true

module VendorSetting
  class LeadColumnsController < VendorSettingController
    def index
      @lead_columns = @current_vendor_group.lead_columns.order(position: "ASC").decorate
      @lead_column = @current_vendor_group.lead_columns.build
    end

    # rubocop:disable Metrics/AbcSize
    def create
      @lead_column = @current_vendor_group.lead_columns.build(lead_column_params)
      if @lead_column.valid?
        ApplicationRecord.transaction do
          @lead_column.save!
          params[:table_column_select_items].split(/\r\n|\r|\n/).each_with_index do |n, i|
            @lead_column.table_column_select_items.create!(name: n, positon: i + 1)
          end
        end
        flash[:success] = t("lead_columns.create.success")
        redirect_back(fallback_location: vendor_setting_lead_columns_path)
      else
        flash.now[:danger] = t("lead_columns.create.error")
        @lead_columns = @current_vendor_group.lead_columns.order(position: "ASC").where.not(id: nil).decorate
        @lead_column = @current_vendor_group.lead_columns.build
        render :index
      end
    end
    # rubocop:enable Metrics/AbcSize

    def edit; end

    def sort
      params[:item].each_with_index do |id, index|
        @current_vendor_group.lead_columns.where(id: id).update_all(position: index + 1)
      end
      head :ok
    end

    private
      def lead_column_params
        params.require(:table_column).permit(:name, :key_name, :data_type, :table_attribute, :position)
      end
  end
end
