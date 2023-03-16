Rails.application.routes.draw do
  resources :meetings, only: [:index, :show, :destroy,:create,:edit,:update] do
    get :confirm
    patch :confirm_meeting
  end
  resources :todos, only: [:index, :destroy,:create,:edit,:update] do
    patch :toggle_status
  end
  resources :clients
  devise_for :users
  root 'home#index'
end
