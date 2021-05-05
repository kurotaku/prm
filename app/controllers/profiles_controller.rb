class ProfilesController < ApplicationController
  def edit; end

  def update
    redirect_to root_path if current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:image)
  end
end
