# frozen_string_literal: true

module ColumnSetting
  class LeadColumnsController < ColumnSettingController
    before_action :set_table_type, only: %i[index create]
    before_action :set_path, only: %i[create update destroy]

    def index
      super
    end

    def create
      super
    end

    def update
      super
    end

    def destroy
      super
    end

    private
      def set_table_type
        @table_type = "lead"
      end

      def set_path
        @path = column_setting_lead_columns_path
      end

      def table_column_params
        super("lead")
      end

      def set_var
        super
        @sort_path = sort_column_setting_lead_columns_path
        @form_url = column_setting_lead_columns_path
      end
  end
end
