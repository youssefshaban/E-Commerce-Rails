Rails.application.routes.draw do
  root 'products#index'
  devise_for :buyers, controllers: { registrations: 'buyers/registrations' }
  # devise_for :buyers, controllers: { registration: 'buyers/registrations' }
  resources :orders
  resources :carts
  # devise_for :buyers
  resources :stores
  devise_for :sellers
  devise_for :admins
  get 'products/myproducts'
  resources :product_attachments
  resources :products
  resources :brands
  resources :cart_carry, :controller => "cart_carries"
  resources :categories





  match 'cart/checkout' => 'carts#checkout',:via => [:post], :as => 'cart_checkout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
