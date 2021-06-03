# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    redirect_to dashboards_path base_path: VendorGroup.all.first.uid
  end
end
