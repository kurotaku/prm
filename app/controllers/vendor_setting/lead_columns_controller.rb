module VendorSetting
  class LeadColumnsController < VendorSettingController
    def index
      @lead_columns = @current_vendor_group.lead_columns.order(order: "ASC").decorate
      @lead_column = LeadColumn.new
    end

    def create
      @lead_column = @current_vendor_group.lead_columns.build(lead_column_params)
      if @lead_column.valid?
        ApplicationRecord.transaction do
          @lead_column.save!
          params[:lead_column_select_items].split(/\r\n|\r|\n/).each_with_index do |n, i|
            @lead_column.lead_column_select_items.create!(name: n, order: i + 1)
          end
        end
        flash[:success] = t("lead_columns.create.success")
        redirect_back(fallback_location: vendor_setting_lead_columns_path)
      else
        flash.now[:danger] = t("lead_columns.create.error")
        @lead_columns = @current_vendor_group.lead_columns.order(order: "ASC").where.not(id: nil).decorate
        render :index
      end
    end

    def edit
    end

    private
      def lead_column_params
        params.require(:lead_column).permit(:name, :key_name, :data_type, :lead_attribute, :order)
      end
  end
end
