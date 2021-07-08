# frozen_string_literal: true

class LeadColumnDecorator < ApplicationDecorator
  delegate_all

  def display_lead_column_select_items
    object.lead_column_select_items.order(position: "ASC").pluck(:name).join(", ") if object.lead_column_select_items.present?
  end

  def display_lead_attribute
    I18n.t("lead.columns." + object.lead_attribute)
  end
end
