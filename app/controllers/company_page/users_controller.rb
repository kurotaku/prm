# frozen_string_literal: true

class CompanyPage::UsersController < ApplicationController
  def index
    @users = @current_company.users.decorate
  end

  def show
  end

  def new
  end

  def edit
  end
end
