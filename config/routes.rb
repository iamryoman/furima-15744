Rails.application.routes.draw do

  devise_for :users
  resources :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :new, :create]
  end
  # resources :order_addresses
end

