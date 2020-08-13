Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  

  resources :credit_cards, only: [:new, :create] do 
  end

  resources :items do
    collection do
      get 'get_category_children', defaults: { fomat: 'json'}
      get 'get_category_grandchildren', defaults: { fomat: 'json'}
    end
  end
end  

