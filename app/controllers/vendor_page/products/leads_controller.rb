# frozen_string_literal: true

class VendorPage::Products::LeadsController < VendorPage::VendorPageController
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
      redirect_to vendor_page_products_leads_path(uid: @product.uid)
    else
      flash.now[:danger] = t("leads.create.error")
      :new
    end
  end

  private
    def set_product
      @product = @current_vendor_group.products.find_by(uid: params[:uid])
    end

    def lead_params
      params.require(:lead).permit(Lead.column_names.map { |c| c.to_sym }).merge(vendor_group_id: @current_vendor_group.id)
    end
end
