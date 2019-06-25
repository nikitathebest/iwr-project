# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/user/existence/:email', to: 'users#email_uniq?', constraints: { email: /.+\..+/}

  namespace :vacancy do
    patch '/publish', to: 'publish#update'
    resources :attributes, param: :attr_id, except: %i[show new]
    resources :country_search, only: %i[index]
    resources :requests, only: %i[index create]
  end

  resources :vacancies, param: :vac_id, except: %i[edit]
  resources :users, param: :user_id, except: %i[index new]

  namespace :user do
    get '/vacancies', to: 'vacancies#index'
    resource :education, only: %i[edit update]
  end

  resource :manager, param: :user_id, only: %i[show]
  resources :profiles, param: :user_id, only: %i[show edit update]
end
