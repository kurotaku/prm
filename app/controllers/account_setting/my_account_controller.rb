module AccountSetting
  class MyAccountController < AccountSettingController
    before_action :set_user

    def show
    end

    def edit
    end

    def update
      if @user.update(user_params)
        flash["success"] = t("users.update.success")
        redirect_back(fallback_location: edit_account_setting_my_account_path)
      else
        flash.now["danger"] = t("users.update.error")
        render :edit
      end
    end

    private

    def set_user
      @user = current_user.decorate
    end

    def user_params
      params.require(:user).permit(:image)
    end
  end
end