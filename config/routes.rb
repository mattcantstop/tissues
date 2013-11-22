Tissues::Application.routes.draw do

  namespace :admin do
    resources :users
  end

  root "projects#index"
  resources :users

  post "/signin", to: "sessions#create"
  get "sessions/new"
  get "/signin", to: "sessions#new"

  resources :projects do
    resources :tickets
  end

end
