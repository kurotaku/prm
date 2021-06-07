module Api
  class ApiController < ApplicationController
    skip_before_action :set_current_vendor_group
    skip_before_action :set_current_staff
    skip_before_action :set_current_company

    before_action :demo

    def demo
      p '====== this is api'
    end
  end
end
