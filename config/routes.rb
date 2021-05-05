Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  namespace :api do 
    namespace :v1 do 
      resources :current_user, only: %i[index]
      get 'boards/:related_object/:related_object_uid' => 'boards#show', as: :board_messages
      resources :boards, only: [:create], param: :uid
      resources :messages, only: [:create], param: :uid
    end 
  end 

  root 'static_pages#home'
  
  scope '/:base_path' do
    resources :dashboards, only: %i[index], param: :uid
    resources :partners, param: :uid
    resources :products, param: :uid
    resources :vendor_groups, param: :uid
    resources :agents, param: :uid
    resources :offers, param: :uid
    resources :vendor_informations, param: :uid
    resources :profiles, only: %i[edit update], param: :uid
  end
end
