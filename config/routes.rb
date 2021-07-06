# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :demos, only: %i[index show]
      resources :presentations, only: %i[show update create]
    end
  end
end
