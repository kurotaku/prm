# frozen_string_literal: true

class MyCompany::StaffsController < ApplicationController
  def index
    @staffs = @current_company.staffs.decorate
    @index_columns = index_column("staff")
  end

  def show; end

  def edit; end
end
