Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :profiles,only: [:new, :create]
  resources :sendings,only: [:new, :create]
  resources :credit_cards, only: [:new, :create, :show, :destroy] do 
    member do 
      get 'buy'
      post 'pay'
    end 
  end
  resources :items, only: :index do
    resources :images, only: [:index, :create]
  end
  resources :items do
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end
end  
