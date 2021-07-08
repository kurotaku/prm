# frozen_string_literal: true

module Api
  class V1::UsingLeadPhaseController < ApiController
    skip_before_action :verify_authenticity_token

    def update
      if LeadPhaseProduct.exists?(lead_phase_product_params)
        LeadPhaseProduct.where(lead_phase_product_params).destroy_all
      else
        LeadPhaseProduct.create(lead_phase_product_params)
      end

      render json: { isUsing: LeadPhaseProduct.exists?(lead_phase_product_params) }
    end

    private
      def lead_phase_product_params
        params.require(:using_lead_phase).permit(:product_id).merge(lead_phase_id: params[:lead_phase_id])
      end
  end
end
