class MakerPage::ProductsController < MakerPage::MakerPageController
  def index
    @products = @current_maker_group.products.all.order(created_at: 'DESC').page(params[:page]).per(10).decorate
  end

  def new
    @product = @current_maker_group.products.build
  end

  def create
     @product = @current_maker_group.products.build(product_params)
    if @product.save
      flash[:success] = t('products.create.success')
      redirect_to maker_page_products_path
    else
      flash.now[:error] = t('products.create.error')
      render :new
    end
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
      params.require(:product).permit(:maker_group, :code, :name, :image, :agency_price, :agency_incentive, :agency_description, :introduction_price, :introduction_incentive, :introduction_description, :wholesale_price, :wholesale_description)
    end   
end
