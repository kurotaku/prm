class CompanyDecorator < ApplicationDecorator
  delegate_all

  def display_hierarchy
    object.hierarchy.to_s + "次店"
  end
end
