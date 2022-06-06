Rails.application.routes.draw do

  devise_for :users
  resources :users
  root to: "items#index"
  resources :items
  resources :donations, only: [:index, :new, :create]
end

