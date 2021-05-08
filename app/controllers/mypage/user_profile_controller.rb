class Mypage::UserProfileController < ApplicationController
  def show
  end
  
  def edit; end

  def update
    if current_user.user_profile.update(user_profile_params)
      flash['success'] = t('user_profile.update.success')
      redirect_to mypage_profile_path
    else
      flash.now['danger'] = t('user_profile.update.error')
      render 'edit'
    end
  end

  private
    def user_profile_params
      params.require(:user_profile).permit(:name, :phone)
    end
end
