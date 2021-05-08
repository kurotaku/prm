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

  scope "/:base_path" do
    namespace :admin do
      resources :companies, param: :uid
      resources :users, param: :uid
    end

    namespace :mypage do
      resource :user_profile, only: %i[show edit update], controller: 'user_profile', as: 'profile', path: 'profile'
      resource :user, only: %i[show edit update], controller: 'user', as: 'user_setting', path: 'user_setting'
      resource :nortification_filters
    end

    namespace :company_page do
      resource :company, only: %i[show edit update], controller: 'company', as: 'profile', path: 'profile'
      resources :user_permissions, only: %i[index create update destroy]
    end

    namespace :maker_page do
      resources :products, param: :uid
      resources :customers, param: :uid
      resources :vendor_groups, param: :uid
      resources :partners, param: :uid
      resources :offers, param: :uid
    end

    namespace :vendor_page do
      resources :agents, param: :uid
      resources :offers, param: :uid
    end

    resource :dashboards, only: %i[show], param: :uid
    resources :partners, param: :uid
    resources :products, param: :uid
    resources :vendor_groups, param: :uid
    resources :agents, param: :uid
    resources :offers, param: :uid
    resources :vendor_informations, param: :uid
    resource :profiles, only: %i[edit update], param: :uid
  end
end
