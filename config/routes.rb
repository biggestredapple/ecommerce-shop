Rails.application.routes.draw do
  resources :categories, only: [:show, :index]
  resources :products, only: [:show, :index]
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "shops#index"

  get 'cart/', to: 'carts#show', as: :show_cart
  post 'cart/:id', to: 'carts#add_product', as: :add_product_to_cart
  delete 'cart/:id', to: 'carts#destroy_product', as: :destroy_cart_product
end
