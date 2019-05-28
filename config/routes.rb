Rails.application.routes.draw do
  resources :profiles, except: [:index]
  resources :educations, except: [:index]
end
