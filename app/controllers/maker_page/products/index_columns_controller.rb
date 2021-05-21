class MakerPage::Products::IndexColumnsController < MakerPage::MakerPageController
  before_action :set_product

  def index
    @index_columns = @product.index_columns
  end

  private

  def set_product
    @product = @current_maker_group.products.find_by(uid: params[:uid])
  end
end
