# frozen_string_literal: true

class ChartDataService
  include BaseService
  include ActiveModel::Model

  def initialize(gadget:, vendor_group:)
    @gadget = gadget
    @vendor_group = vendor_group
  end

  def perform
    case @gadget.chart_type
    when "vertical_bar"
      vertical_bar
    when "stacked_bar"
      stacked_bar
    end
  end

  private
    def vertical_bar
      chart_data = {}
      objects = relation_objects(@vendor_group, @gadget.target_table)
      chart_data[:label] = objects.pluck(:name)
      chart_data[:data] = objects.pluck(@gadget.target_column.table_attribute)
      chart_data
    end

    # rubocop:disable Metrics/AbcSize
    def stacked_bar
      chart_data = { label: [], data: {} }
      objects = relation_objects(@vendor_group, @gadget.target_table)
      objects = objects.joins(@gadget.row_group.to_sym).group(@gadget.row_group.pluralize + ".name") if @gadget.row_group.present?
      objects = objects.joins(@gadget.col_group.to_sym).group(@gadget.col_group.pluralize + ".name") if @gadget.col_group.present?
      objects_data = objects.sum(@gadget.target_column.table_attribute)
      objects_data.each do |k, v|
        if chart_data[:data].has_key?(k[0])
          chart_data[:data][k[0]].store k[1], v
        else
          chart_data[:data].store k[0], { k[1] => v }
        end
      end
      chart_data
    end
  # rubocop:enable Metrics/AbcSize
end
