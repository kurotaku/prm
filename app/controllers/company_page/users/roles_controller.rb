class CompanyPage::Users::RolesController < ApplicationController
  def index
    @users = @current_company.users.decorate
  end

  def update
  end
end
