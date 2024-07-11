Rails.application.routes.draw do
  resources :careers
  resources :applicants, only: [ :index, :new, :create ]
  resources :positions
  resources :companies, only: [ :new, :edit, :update, :create ]
  root "home#index"
  devise_for :users
end
