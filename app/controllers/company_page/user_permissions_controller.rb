# frozen_string_literal: true

class CompanyPage::UserPermissionsController < ApplicationController
  def index
    @parmissions = @current_company.user_action_permissions
    @parmission = UserActionPermission.new
  end

  def create
    @parmission = UserActionPermission.new(parmission_params)
    if @parmission.save
      flash[:success] = t("user_action_permission.create.success")
      redirect_back(fallback_location: company_page_user_permissions_path)
    else
      flash.now[:danger] = t("user_action_permission.create.error")
      @parmissions = @current_company.user_action_permissions
      render :index
    end
  end

  private
    def parmission_params
      params.require(:user_action_permission).permit(:user_action_id, :company_id, :permit_role)
    end
end
