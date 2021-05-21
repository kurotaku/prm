class MakerPage::ProductsController < MakerPage::MakerPageController
  def index
    @products = @current_maker_group.products.all.order(created_at: 'DESC').page(params[:page]).per(10).decorate
  end

  def new
  end

  def create
  end

  def show
    @product = Product.find_by(uid: params[:uid]).decorate
  end

  def edit
  end
end
