Rails.application.routes.draw do
  root 'products#index'

  devise_for :users

  resources :products

  get 'pages/about'

  get 'pages/contact'
end
