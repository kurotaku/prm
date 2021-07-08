# frozen_string_literal: true

module Api
  class ApiController < ApplicationController
    skip_before_action :set_current_vendor_group
    skip_before_action :set_current_staff
    skip_before_action :set_current_company
  end
end
