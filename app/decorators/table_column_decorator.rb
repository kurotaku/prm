# frozen_string_literal: true

class TableColumnDecorator < ApplicationDecorator
  delegate_all

  def display_table_column_select_items
    object.table_column_select_items.order(position: "ASC").pluck(:name).join(", ") if object.table_column_select_items.present?
  end

  def display_lead_attribute
    I18n.t("lead.columns." + object.table_attribute)
  end
end
