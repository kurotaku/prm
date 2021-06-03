# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_company
  before_action :set_current_vendor_group
  before_action :check_user_permission

  def set_current_company
    @current_company = current_user.company.decorate if user_signed_in?
  end

  def set_current_vendor_group
    @current_vendor_group = VendorGroup.find_by(uid: params[:base_path]) if @current_company.present?
  end

  def check_user_permission
    # p controller_path
    # p action_name
    user_action = UserAction.find_by(ctrl_path: controller_path, act_path: action_name)
    return unless user_action
    permission = user_action.user_action_permissions.find_by(company: @current_company)
    return unless permission
    if current_user.role_before_type_cast < permission.permit_role_before_type_cast
      flash[:danger] = I18n.t("errors.messages.check_user_permission", level: permission.permit_role_i18n)
      redirect_to root_path
    end
  end
end
