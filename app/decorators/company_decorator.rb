class CompanyDecorator < ApplicationDecorator
  delegate_all

  def display_hierarchy
    object.hierarchy.to_s + "次店"
  end

  def thumbnail
    object.organization.present? ? organization.decorate.thumbnail : helpers.asset_path("company_default.png")
  end
end
