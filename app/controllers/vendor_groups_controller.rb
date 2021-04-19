class VendorGroupsController < ApplicationController
  def index
    @vendor_groups = @current_company.vendor_groups.decorate
  end

  def show
    @vendor_group = VendorGroup.find(params[:id])
    @agents = @vendor_group.agents.where(parent: nil)
  end
end
