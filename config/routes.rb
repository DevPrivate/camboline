Rails.application.routes.draw do
  root 'products#index'

  devise_for :users

  resources :products
  get 'yourproducts', to: 'products#yourproducts'

  get 'pages/about'

  get 'pages/contact'
end
