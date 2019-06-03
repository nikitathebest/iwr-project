# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  get '/signup', to: 'users#new'
  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, param: :user_id, only: %i[new create]
  resources :profiles, only: %i[show edit update]
end
