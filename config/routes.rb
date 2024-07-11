Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users

  authenticate :seller_user do
    root to: 'seller#home', as: :seller_root
  end

  namespace :seller, path: '', as: '' do
    resources :products
    resources :stocks
  end

  get "up" => "rails/health#show", as: :rails_health_check

  get "seller" => "seller#home"

end
