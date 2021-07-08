# frozen_string_literal: true

class VendorSetting::BaseSettingController < ApplicationController
  def edit
    @vendor_group = @current_vendor_group
  end
end
