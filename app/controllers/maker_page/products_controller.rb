class MakerPage::ProductsController < MakerPage::MakerPageController
  def index
    @products = @current_maker_group.products.all.order(created_at: 'DESC').page(params[:page]).per(10).decorate
  end

  def new
    @product = @current_maker_group.products.build
  end

  def create
  end

  def show
    @product = Product.find_by(uid: params[:uid]).decorate
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def product_params
      params.require(:product).permit(:maker_group, :code, :name, :image)
    end   
end
