Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :profiles,only: [:new, :create]
  resources :sendings,only: [:new, :create]
end
