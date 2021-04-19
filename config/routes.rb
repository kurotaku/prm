Rails.application.routes.draw do
  devise_for :users
  resources :partners
  resources :products
  resources :vendor_groups
  resources :agents
  resources :offers
  resources :vendor_informations
end
