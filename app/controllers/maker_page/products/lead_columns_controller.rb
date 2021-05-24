module MakerPage
  class Products::LeadColumnsController < MakerPageController
    before_action :set_product

    def index
      @lead_columns = @product.lead_columns
      @lead_column = LeadColumn.new
    end

    def create
      @lead_column = @product.lead_columns.build(lead_column_params)
      if @lead_column.save
        flash[:success] = t('lead_columns.create.success')
        redirect_back(fallback_location: maker_page_products_lead_columns_path(uid: @product.uid))
      else
        flash.now[:danger] = t('lead_columns.create.error')
        @lead_columns = @product.lead_columns.where.not(id: nil)
        render :index
      end
    end

    def edit
    end

    private

      def set_product
        @product = @current_maker_group.products.find_by(uid: params[:uid])
      end

      def lead_column_params
        params.require(:lead_column).permit(:name, :key_name, :data_type, :lead_column, :order)
      end
  end
end