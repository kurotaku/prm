module AccountSetting
  class AccountSettingController < ApplicationController
    layout "application_account_setting"

    skip_before_action :set_current_vendor_group
    skip_before_action :set_current_staff
    skip_before_action :set_current_company
  end
end
