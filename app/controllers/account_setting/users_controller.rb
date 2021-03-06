# frozen_string_literal: true

module AccountSetting
  class UsersController < AccountSettingController
    def index
      @users = @current_organization.users.decorate.order(created_at: "ASC")
    end

    def show; end

    def new; end

    def edit; end
  end
end
