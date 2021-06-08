# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout "application_no_menu"

  skip_before_action :set_current_organization
  skip_before_action :set_current_vendor_group
  skip_before_action :set_current_staff
  skip_before_action :set_current_company
  skip_before_action :check_user_permission

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
