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
      resources :using_lead_phase, only: [:update], param: :lead_phase_id
      resources :dashboard_layout, only: [:update], param: :dashboard_id
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

    resource :dashboards, only: %i[show]

    resource :reports, only: %i[show]
    namespace :reports, path: "report" do
      resources :partners, controller: "partners", only: %i[index]
      resources :leads, controller: "leads", only: %i[index]
    end

    resources :products, param: :uid do
      member do
        namespace :products, path: "" do
          resources :lead_phases, controller: "lead_phases", only: %i[index]
        end
      end
    end

    resources :leads, param: :uid
    namespace :leads, path: "lead" do
      resources :csvs, controller: "csvs"
    end

    resources :partners, param: :uid do
      member do
        namespace :partners, path: "" do
          resources :leads, param: :lead_uid
        end
      end
    end

    resources :staffs, param: :uid do
      member do
        namespace :staffs, path: "" do
          resources :leads, param: :lead_uid
        end
      end
    end

    resources :contracts, param: :uid

    resources :files, param: :uid do
      member do
        get "download", to: "files#download"
        namespace :files, path: "" do
          resources :download_histories, only: %i[index]
        end
      end
    end

    resource :profiles, only: %i[edit update], param: :uid

    namespace :column_setting do
      resources :lead_columns, param: :uid, only: %i[index create edit update destroy] do
        collection do
          patch :sort
        end
      end
      resources :product_columns, param: :uid, only: %i[index create edit update destroy] do
        collection do
          patch :sort
        end
      end
      resources :company_columns, param: :uid, only: %i[index create edit update destroy] do
        collection do
          patch :sort
        end
      end
      resources :contract_columns, param: :uid, only: %i[index create edit update destroy] do
        collection do
          patch :sort
        end
      end
    end

    namespace :vendor_setting do
      resource :base_setting, only: %i[edit update], controller: "base_setting"
      resources :lead_columns do
        collection do
          patch :sort
        end
      end
      resources :lead_phases do
        collection do
          patch :sort
        end
      end
    end
  end
end
