class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_current_company
  before_action :set_current_maker_group

  def set_current_company
    @current_company = current_user.company if user_signed_in?
  end

  # FIX ME: 複数メーカー対応していない
  def set_current_maker_group
    @current_maker_group = @current_company.maker_groups.last if @current_company.present?
  end
end
