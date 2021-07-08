# frozen_string_literal: true

module Api
  class V1::DashboardLayoutController < ApiController
    skip_before_action :verify_authenticity_token

    # rubocop:disable Layout/LineLength
    def update
      update = DashboardLayout.find_or_initialize_by(dashboard_id: dashboard_layout_params[:dashboard_id]).update(layout: JSON.parse(dashboard_layout_params[:layout]))
      render json: { update: update }
    end
    # rubocop:enable Layout/LineLength

    private
      def dashboard_layout_params
        params.require(:dashboard_layout).permit(:layout).merge(dashboard_id: params[:dashboard_id])
      end
  end
end
