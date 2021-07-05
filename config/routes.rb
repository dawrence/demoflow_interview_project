Rails.application.routes.draw do
  root 'home#index'

  resources :demos, only: %i[index]

  resources :presentations, only: %i[show update create]
end
