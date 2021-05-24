module MakerPage
  class Products::LeadCategoriesController < MakerPageController
    before_action :set_product

    def index
      @categories = @product.lead_categories
    end

    def show
      @category = LeadCategory.find(params[:id])
    end

    private

      def set_product
        @product = @current_maker_group.products.find_by(uid: params[:uid])
      end
  end
end
