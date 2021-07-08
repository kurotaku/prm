# frozen_string_literal: true

class StaffsController < ApplicationController
  before_action :set_staff, only: %i[show edit update destroy]
  def index
    @staffs = @current_vendor_group.staffs.order(created_at: "DESC").page(params[:page]).per(10).decorate
    @index_columns = index_column("staff")
  end

  def show; end

  def new; end

  def edit; end

  def update
    if @staff.update(staff_params)
      flash[:success] = t("staffs.update.success")
      redirect_to staff_path(uid: @staff.uid)
    else
      flash.now[:danger] = t("staffs.update.error")
      render :edit
    end
  end

  def destroy
    @staff.destroy

    flash[:success] = t("staffs.destroy.success")
    redirect_to staffs_path
  end

  private
    def set_staff
      @staff = Staff.find_by(uid: params[:uid]).decorate
    end

    def staff_params
      params.require(:staff).permit(Staff.column_names.map { |c| c.to_sym }).merge(vendor_group_id: @current_vendor_group.id)
    end
end
