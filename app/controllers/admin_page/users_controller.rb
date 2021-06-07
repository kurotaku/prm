# frozen_string_literal: true

module AdminPage
  class UsersController < AdminPageController
    def index
      @users = User.all.order(created_at: "DESC").page(params[:page]).per(10).decorate
      if params[:organization_id].present?
        @users = @users.where(organization_id: params[:organization_id])
        params[:page] = ""
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      @user.skip_confirmation!
      if @user.save
        flash["success"] = t("users.create.success")
        redirect_to admin_page_users_path
      else
        flash.now["danger"] = t("users.create.error")
        render :new
      end
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def user_params
      params.require(:user).permit(:organization_id, :email, :role, :name, :password, :password_confirmation)
    end
  end
end
