# frozen_string_literal: true

module AdminPage
  class LeadsController < AdminPageController
    def index
      @leads = Lead.all.order(created_at: "DESC").page(params[:page]).per(10).decorate
    end
  end
end
