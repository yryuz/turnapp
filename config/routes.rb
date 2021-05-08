Rails.application.routes.draw do
  devise_for :users
  root to: "tunes#index"
  resources :tunes
  resources :users, only: :show
end
