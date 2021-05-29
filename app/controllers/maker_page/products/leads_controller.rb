# frozen_string_literal: true

class MakerPage::Products::LeadsController < MakerPage::MakerPageController
  before_action :set_product

  def index
    @leads = @product.leads.order(created_at: "DESC")
  end

  def show
  end

  def new
    @lead = @product.leads.build
  end

  def create
    @lead = @product.leads.build(lead_params)
    if @lead.save
      flash[:success] = t("leads.create.success")
      redirect_to maker_page_products_leads_path(uid: @product.uid)
    else
      flash.now[:danger] = t("leads.create.error")
      :new
    end
  end

  private
    def set_product
      @product = @current_maker_group.products.find_by(uid: params[:uid])
    end

    def lead_params
      params.require(:lead).permit(Lead.column_names.map { |c| c.to_sym }).merge(maker_group_id: @current_maker_group.id)
    end
end
