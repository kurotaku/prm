# frozen_string_literal: true

module AdminPage
  class AdminPageController < ApplicationController
    layout "application_admin"

    skip_before_action :set_current_vendor_group
    skip_before_action :set_current_staff
    skip_before_action :set_current_company

    before_action :check_admin

    private
      def check_admin
        return unless current_user

        if current_user.account_type != "admin"
          # デバッグ用 普段はコメントアウト
          flash[:danger] = I18n.t("errors.messages.check_admin")
          redirect_to root_path
        end
      end
  end
end
