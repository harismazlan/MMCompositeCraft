# frozen_string_literal: true

Rails.application.routes.draw do
  resources :boats
  resources :users do
    resources :appointments, except: [:all]
  end
  # nested resources for appointments to utilize association
  resources :appointments, only: [:all]
  resources :sessions, only: %i[new create destroy]

  root 'home#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/auth/:provider/callback' => 'sessions#create_from_omniauth'
  get 'all_appointments', to: 'appointments#all', as: 'all_appointments'
end
