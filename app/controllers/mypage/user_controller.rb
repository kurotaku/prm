# frozen_string_literal: true

class Mypage::UserController < ApplicationController
  def edit; end

  def update
    if current_user.update(user_params)
      flash["success"] = t("users.update.success")
      redirect_back(fallback_location: edit_mypage_user_setting_path)
    else
      flash.now["danger"] = t("users.update.error")
      render "edit"
    end
  end

  private
    def user_params
      params.require(:user).permit(:image)
    end
end
