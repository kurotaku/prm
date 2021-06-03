# frozen_string_literal: true

class VendorPage::VendorGroupsController < VendorPage::VendorPageController
  def index
    @vendor_groups = @current_vendor_group.vendor_groups
  end

  def new
    @vendor_group = @current_vendor_group.vendor_groups.build
  end

  def create
    @vendor_group = @current_vendor_group.vendor_groups.build(vendor_group_params)
    if @vendor_group.save
      flash[:success] = t("vendor_groups.create.success")
      redirect_to vendor_page_vendor_groups_path
    else
      flash.now[:danger] = t("vendor_groups.create.error")
      render :new
    end
  end

  def show
    @vendor_group = @current_vendor_group.vendor_groups.find_by(uid: params[:uid])
  end

  def edit
  end

  private
    def vendor_group_params
      params.require(:vendor_group).permit(:vendor_id, :product_id, :price, :incentive, :layer, :contract_type, :maker_memo)
    end
end
