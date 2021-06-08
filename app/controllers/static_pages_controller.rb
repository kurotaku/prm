# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    redirect_to dashboards_path base_path: @current_organization.vendor_groups.first.uid
  end
end
