class MakerPage::Products::LeadsController <  MakerPage::MakerPageController
  before_action :set_product

  def index
    @leads = @product.leads
  end

  def show
  end

  def new
  end

  private

    def set_product
      @product = @current_maker_group.products.find_by(uid: params[:uid])
    end
end
