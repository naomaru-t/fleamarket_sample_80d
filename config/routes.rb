Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'sendings', to: 'users/registrations#new_sending'
    post 'sendings', to: 'users/registrations#create_sending'
  end
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :credit_cards, only: [:new, :create, :show, :destroy] do 
    member do 
      get 'buy'
      post 'pay'
    end 
  end
  # カテゴリー機能実装後、消去予定
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
