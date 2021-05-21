class MakerPage::Products::LeadRawLabelsController < MakerPage::MakerPageController
  before_action :set_product
  
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  private

    def set_product
      @product = @current_maker_group.products.find_by(uid: params[:uid])
    end
end
