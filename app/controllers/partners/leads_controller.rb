# frozen_string_literal: true

module Partners
  class LeadsController < PartnersController
    before_action :set_partner

    def index
      @leads = @partner.leads.order(created_at: "DESC").page(params[:page]).per(10).decorate
      @index_columns = index_column("lead")
    end

    def show; end
  end
end
