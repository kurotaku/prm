# frozen_string_literal: true

class VendorPage::PartnersController < VendorPage::VendorPageController
  def index
    @partners = @current_vendor_group.partners.order(created_at: "ASC").decorate
  end

  def new
    @partner = @current_vendor_group.partners.build
  end

  def create
    @partner = @current_vendor_group.partners.build(partner_params)
    if @partner.save
      flash[:success] = t("partners.create.success")
      redirect_to vendor_page_partners_path
    else
      flash.now[:error] = t("partners.create.error")
      render :new
    end
  end

  def show
    @partner = @current_vendor_group.partners.find_by(uid: params[:uid]).decorate
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def partner_params
      params.require(:partner).permit(:name, :address, :parent_id, :hierarchy, :maker_memo)
    end
end
