Rails.application.routes.draw do
  resources :boats
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  root 'home#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

end
