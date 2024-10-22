Rails.application.routes.draw do
  get 'store', to: 'store#index', as: 'store_index' # Página principal de la tienda
  get 'store/:id', to: 'store#show', as: 'store_product' # Página de detalles del producto

  root 'pages#home'
  devise_for :users

  authenticate :seller_user do
    root to: 'seller#home', as: :seller_root
  end

  namespace :seller, path: '', as: '' do
    resources :products
    resources :stocks
    resources :orders
  end

  get "up" => "rails/health#show", as: :rails_health_check

  get "seller" => "seller#home"

end
