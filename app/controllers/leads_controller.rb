class LeadsController < ApplicationController
  def index
    @leads = @current_vendor_group.leads.order(created_at: "DESC")
  end

  def show
  end

  def new
    @lead = @current_vendor_group.leads.build
  end

  def create
    @lead = Lead.new(lead_params)
    if @lead.save
      flash[:success] = t("leads.create.success")
      redirect_to leads_path
    else
      flash.now[:danger] = t("leads.create.error")
      render :new
    end
  end

  def edit
  end

  private
    def lead_params
      params.require(:lead).permit(Lead.column_names.map { |c| c.to_sym }).merge(vendor_group_id: @current_vendor_group.id)
    end
end
