class MyCompany::StaffsController < ApplicationController
  def index
    @staffs = @current_company.staffs.decorate
  end

  def show
  end

  def edit
  end
end
