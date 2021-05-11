class AdminPage::CompaniesController < AdminPage::AdminPageController
  def index
    @companies = Company.all.order(created_at: 'DESC').page(params[:page]).per(10).decorate
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = t('companies.create.success')
      redirect_to admin_page_companies_path
    else
      flash.now[:error] = t('companies.create.error')
      render :new
    end
  end

  def show
    
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
