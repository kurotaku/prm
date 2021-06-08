module AccountSetting
  class OrganizationController < AccountSettingController
    before_action :set_organization

    def edit
    end

    def update
      if @organization.update(organization_params)
        flash["success"] = t("organizations.update.success")
        redirect_back(fallback_location: edit_account_setting_organization_path)
      else
        flash.now["danger"] = t("organizations.update.error")
        render :edit
      end
    end

    private
      def set_organization
        @organization = @current_organization.decorate
      end

      def organization_params
        params.require(:organization).permit(:name, :image, :phone, :address)
      end
  end
end
