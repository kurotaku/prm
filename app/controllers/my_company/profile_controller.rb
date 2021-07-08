# frozen_string_literal: true

class MyCompany::ProfileController < ApplicationController
  before_action :set_company

  def edit; end

  def update
    if @company.update(company_params)
      flash[:success] = t("partners.update.success")
      redirect_to edit_my_company_profile_path(uid: @company.uid)
    else
      flash.now[:danger] = t("partners.update.error")
      render :edit
    end
  end

  private
    def set_company
      @company = @current_company.decorate
    end

    def company_params
      params.require(:company).permit(Product.column_names.map { |c| c.to_sym }).merge(vendor_group_id: @current_vendor_group.id)
    end
end
