# frozen_string_literal: true

module VendorPage
  class VendorPageController < ApplicationController
    layout "application_maker"

    before_action :check_maker

    private
      def check_maker
        return unless @current_Organization
        if @current_Organization.contract_type != "maker"
          # デバッグ用 普段はコメントアウト
          flash[:danger] = I18n.t("errors.messages.check_maker")
          redirect_to root_path
        end
      end
  end
end
