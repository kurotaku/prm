# frozen_string_literal: true

module VendorSetting
  class LeadPhasesController < VendorSettingController
    def index
      @lead_phases = @current_vendor_group.lead_phases.order(position: "ASC").decorate
      @lead_phase = LeadPhase.new
    end

    def create
      @lead_phase = @current_vendor_group.lead_phases.build(lead_phase_params)
      if @lead_phase.save
        flash[:success] = t("lead_phases.create.success")
        redirect_back(fallback_location: vendor_setting_lead_phases_path)
      else
        flash.now[:danger] = t("lead_phases.create.error")
        @lead_phases = @current_vendor_group.lead_phases.order(position: "ASC").where.not(id: nil).decorate
        render :index
      end
    end

    def edit; end

    def sort
      params[:item].each_with_index do |id, index|
        @current_vendor_group.lead_phases.where(id: id).update_all(position: index + 1)
      end
      head :ok
    end

    private
      def lead_phase_params
        params.require(:lead_phase).permit(:name, :position, :phase_role)
      end
  end
end
