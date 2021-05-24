module MakerPage
  class Products::IndexColumnsController < MakerPageController
    before_action :set_product

    def index
      @index_columns = @product.lead_index_columns
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_product
      @product = @current_maker_group.products.find_by(uid: params[:uid])
    end
  end
end
