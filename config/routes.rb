# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions:      "users/sessions",
  }

  namespace :api do
    namespace :v1 do
      resources :current_user, only: %i[index]
      get "boards/:related_object/:related_object_uid" => "boards#show", as: :board_messages
      resources :boards, only: [:create], param: :uid
      resources :messages, only: [:create], param: :uid
    end
  end

  root "static_pages#home"

  namespace :admin_page do
    resources :organizations
    resources :users
    resources :leads
    namespace :leads, path: "lead" do
      resources :csvs, controller: "csvs"
    end
    resources :user_actions
    resources :files, param: :uid do
      member do
        get "download", to: "files#download"
      end
    end
  end

  namespace :account_setting do
    resource :my_account, controller: "my_account", only: %i[edit update]
    resource :organization, controller: "organization", only: %i[edit update]
    resources :users, param: :uid
  end

  scope "/:base_path" do
    namespace :mypage do
      resource :profile, only: %i[edit update], controller: "profile"
      resource :user, only: %i[show edit update], controller: "user", as: "user_setting", path: "user_setting"
    end

    namespace :my_company do
      resource :profile, only: %i[edit update], controller: "profile"
      resources :staffs, param: :uid
    end

    # namespace :organization_page do
    #   resource :organization, only: %i[show edit update], controller: "organization", as: "profile", path: "profile"
    #   resources :user_profiles, param: :uid
    #   resources :users, param: :uid
    #   namespace :users, path: "user" do
    #     resources :roles, only: %i[index update], param: :uid
    #   end
    #   resources :user_permissions, only: %i[index create update destroy]
    # end

    # namespace :vendor_page do
    #   resource :dashboards, only: %i[show], param: :uid
    #   resources :products, param: :uid do
    #     member do
    #       namespace :products, path: "" do
    #         resources :leads
    #         resources :lead_columns
    #       end
    #     end
    #   end
    #   resources :customers, param: :uid
    #   resources :partners, param: :uid
    #   resources :files, param: :uid do
    #     member do
    #       get "download", to: "files#download"
    #     end
    #   end
    #   resources :download_histories, only: %i[index]
    # end

    resource :dashboards, only: %i[show], param: :uid
    resources :products, param: :uid
    resources :leads, param: :uid
    resources :partners, param: :uid
    resources :files, param: :uid do
      member do
        get "download", to: "files#download"
        namespace :files, path: "" do
          resources :download_histories, only: %i[index]
        end
      end
    end

    resource :profiles, only: %i[edit update], param: :uid

    namespace :vendor_setting do
      resource :base_setting, only: %i[edit update], controller: "base_setting"
      resources :lead_columns
    end
  end
end
