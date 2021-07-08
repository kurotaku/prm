# frozen_string_literal: true

class Mypage::ProfileController < ApplicationController
  before_action :set_staff

  def edit; end

  def update
    if @staff.update(staff_params)
      flash["success"] = t("profile.update.success")
      redirect_back(fallback_location: edit_mypage_profile_path)
    else
      flash.now["danger"] = t("profile.update.error")
      render "edit"
    end
  end

  private
    def set_staff
      @staff = @current_staff.decorate
    end

    def staff_params
      params.require(:staff).permit(Staff.column_names.map { |c| c.to_sym }).merge(vendor_group_id: @current_vendor_group.id)
    end
end
