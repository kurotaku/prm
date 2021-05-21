class MakerPage::PartnersController < MakerPage::MakerPageController
  def index
    @partners = @current_maker_group.partners.order(created_at: 'ASC').decorate
  end

  def new
    @partner = @current_maker_group.partners.build
  end

  def create
    @partner = @current_maker_group.partners.build(partner_params)
    if @partner.save
      flash[:success] = t('partners.create.success')
      redirect_to maker_page_partners_path
    else
      flash.now[:error] = t('partners.create.error')
      render :new
    end
  end

  def show
    @partner = @current_maker_group.partners.find_by(uid: params[:uid]).decorate
  end

  private

    def partner_params
      params.require(:partner).permit(:name, :address, :parent_id, :hierarchy, :maker_memo)
    end
end
