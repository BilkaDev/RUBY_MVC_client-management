Rails.application.routes.draw do
  resources :todos
  resources :clients
  devise_for :users
  root 'home#index'
end
