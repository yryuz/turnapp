Rails.application.routes.draw do
  devise_for :users
  root to: "tunes#index"
  resources :tunes do
    resources :comments, only: :create
  end
  resources :users, only: [:show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
end
