Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "products#index"

  resources :products, only: [:index, :show] do
    post :add_to_cart, on: :member
    post :remove_from_cart, on: :member
    post :adjust_item, on: :member
  end

  resource :cart
  resources :orders do
    post :checkout_spgateway, on: :member
  end

  namespace :admin do
    resources :orders
    resources :products
    root "products#index"
  end

post 'spgateway/return'




end
