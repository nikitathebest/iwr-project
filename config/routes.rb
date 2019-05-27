Rails.application.routes.draw do
  resources :profiles, except: [:index]
end
