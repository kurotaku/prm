module AdminPage
  class Leads::CsvsController < AdminPageController
    def index
      @csvs = CsvImportHistory.where(related_object: :lead).page(params[:page]).per(10)
    end

    def new
      redirect_to(admin_page_leads_csvs_path,
alert: "\u30E1\u30FC\u30AB\u30FC\u304C\u9078\u629E\u3055\u308C\u3066\u3044\u307E\u305B\u3093") && return if params[:maker_group_id].blank?
      @maker_group = MakerGroup.where(id: params[:maker_group_id]).decorate
      @products = @maker_group.first.products
      @csv = CsvImportHistory.new
    end

    def create
      @csv = CsvImportHistory.new(csv_params)
      maker_group = MakerGroup.find(@csv.maker_group.id)
      product = Product.find(params[:product_id])

      if @csv.valid?
        ApplicationRecord.transaction do
          Admin::CsvService::ImportLeadFromCsvService.perform(csv_file: params[:csv_import_history][:csv_file], maker_group: maker_group, product: product)
          @csv.save!
        end
        flash[:success] = t("csv_import_histories.create.success")
        redirect_to admin_page_leads_csvs_path
      else
        flash.now[:danger] = t("csv_import_histories.create.error")
        render :new
      end
    end

    private
      def csv_params
        params.require(:csv_import_history).permit(:maker_group_id).merge(related_object: "lead")
      end
  end
end
