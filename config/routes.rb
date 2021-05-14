Rails.application.routes.draw do
  devise_for :admins
  resources :product_attachments
  resources :products
  resources :brands
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
