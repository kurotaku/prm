class StaticPagesController < ApplicationController
  def home
    redirect_to partners_path base_path: @current_company.maker_group_uid(params)
  end
end
