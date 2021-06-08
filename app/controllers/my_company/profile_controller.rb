class MyCompany::ProfileController < ApplicationController
  before_action :set_company

  def edit
    
  end

  def update
    if @company.update()
    else
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :phone, :address)
  end

  def set_company
    @company = @current_company.decorate
  end
end
