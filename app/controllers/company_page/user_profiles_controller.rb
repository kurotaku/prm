# frozen_string_literal: true

class CompanyPage::UserProfilesController < ApplicationController
  def index
    @profiles = @current_company.user_profiles.decorate
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
