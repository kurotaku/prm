# frozen_string_literal: true

class VendorGroupsController < ApplicationController
  def index
    @vendor_groups = @current_company.vendor_groups.decorate
  end

  def show
    @vendor_group = VendorGroup.find_by(uid: params[:uid])
    @agents = @vendor_group.agents.where(parent: nil)
  end
end
