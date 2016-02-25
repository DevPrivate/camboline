Rails.application.routes.draw do
  resources :products

  get 'pages/about'

  get 'pages/contact'

  root 'products#index'

end
