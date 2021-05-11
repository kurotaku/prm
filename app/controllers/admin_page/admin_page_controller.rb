module AdminPage
  class AdminPageController < ApplicationController
    layout 'application_admin'

    before_action :check_admin

    private

    def check_admin
      return unless current_user
      if current_user.account_type != 'admin'
        # デバッグ用 普段はコメントアウト
        flash[:danger] = I18n.t("error.messages.check_admin")
        redirect_to root_path
      end
    end
  end
end
