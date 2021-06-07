# frozen_string_literal: true

class AdminPage::OrganizationsController < AdminPage::AdminPageController
  def index
    @organizations = organization.all.order(created_at: "DESC").page(params[:page]).per(10).decorate
  end

  def new
    @organization = organization.new
  end

  def create
    @organization = organization.new(organization_params)
    if @organization.save
      flash[:success] = t("organizations.create.success")
      redirect_to admin_page_organizations_path
    else
      flash.now[:error] = t("organizations.create.error")
      render :new
    end
  end

  def show
  end

  private
    def organization_params
      params.require(:organization).permit(:name)
    end
end
