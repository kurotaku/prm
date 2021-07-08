# frozen_string_literal: true

class CompanyDecorator < ApplicationDecorator
  delegate_all

  def display_hierarchy
    object.hierarchy.to_s + "\u6B21\u5E97"
  end

  def thumbnail
    object.organization.present? ? organization.decorate.thumbnail : helpers.asset_path("company_default.png")
  end
end
