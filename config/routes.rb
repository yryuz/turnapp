Rails.application.routes.draw do
  devise_for :users
  root to: "tunes#index"
  
  resources :tunes, only: [:index, :new, :create]
end
