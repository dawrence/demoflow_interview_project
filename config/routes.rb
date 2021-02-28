Rails.application.routes.draw do
  get 'home/index'
  get 'home/timestamp'

  root 'home#index'
end
