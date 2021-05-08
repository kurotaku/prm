class CompanyPage::CompanyController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if @current_company.update(company_params)
      flash['success'] = t('companies.update.success')
      redirect_to company_page_profile_path
    else
      flash.now['danger'] = t('companies.update.error')
      render 'edit'
    end
  end

  private

    def company_params
      params.require(:company).permit(:address, :address2, :contract_type, :coprate_number, :email, :fax, :image, :name, :name_kana, :phone, :postcode, :settlement_month, :prefecture_id)
    end
end
