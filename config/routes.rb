# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # resources :educations, except: [:index]
  resources :users, param: :user_id, except: %i[index new] do
    member do
      resource :educations, only: %i[edit]
    end
  end

  resources :profiles, only: %i[show edit update]
end
