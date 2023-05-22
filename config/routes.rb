Rails.application.routes.draw do

  devise_for :users
  resources :festivals, only:[:index, :show]
  resources :order_items
  resource :basket, only:[:show]
  resource :purchases, only:[:show, :create]
  resource :profiles, only:[:show]
  get 'help/index'
  get 'world_map/index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
