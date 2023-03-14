Rails.application.routes.draw do
  resources :todos do
    patch :toggle_status
  end
  resources :clients
  devise_for :users
  root 'home#index'
end
