Rails.application.routes.draw do
  devise_for :users
  root to: "tunes#index"
  
  resources :tunes
end
