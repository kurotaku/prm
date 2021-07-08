# frozen_string_literal: true

module ColumnSetting
  class ColumnSettingController < ApplicationController
    before_action :set_table_column, only: %i[edit update destroy]
    before_action :set_var, only: %i[index]

    def index
      @table_columns = @current_vendor_group.table_columns.where(table_type: @table_type).order(position: "ASC").decorate
    end

    # rubocop:disable Metrics/AbcSize
    def create
      @table_column = @current_vendor_group.table_columns.build(table_column_params)
      if @table_column.valid?
        ApplicationRecord.transaction do
          @table_column.save!
          params[:table_column_select_items].split(/\r\n|\r|\n/).each_with_index do |n, i|
            @table_column.table_column_select_items.create!(name: n, position: i + 1)
          end
        end
        flash[:success] = t("table_columns.create.success")
        redirect_back(fallback_location: @path)
      else
        flash.now[:danger] = t("table_columns.create.error")
        @table_columns = @current_vendor_group.table_columns.where(table_type: @table_type).order(position: "ASC").where.not(id: nil).decorate
        set_var
        render :index
      end
    end
    # rubocop:enable Metrics/AbcSize

    def edit; end

    def update
      if @table_column.update(table_column_params)
        flash[:success] = t("table_columns.update.success")
        redirect_to @path
      else
        flash.now[:danger] = t("table_columns.update.error")
        render :edit
      end
    end

    def destroy
      @table_column.destroy

      flash[:success] = t("table_columns.destroy.success")
      redirect_to @path
    end

    def sort
      params[:item].each_with_index do |id, index|
        @current_vendor_group.table_columns.where(id: id).update_all(position: index + 1)
      end
      head :ok
    end

    private
      def set_table_column
        @table_column = TableColumn.find_by(uid: params[:uid])
      end

      def set_var
        @table_column = @current_vendor_group.table_columns.build
      end

      def table_column_params(table_type)
        params.require(:table_column).permit(:name, :key_name, :data_type, :table_attribute, :index_page_position).merge(table_type: table_type)
      end
  end
end
