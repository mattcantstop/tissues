Tissues::Application.routes.draw do

  namespace :admin do
    root "base#index"
    resources :users do
      resources :permissions
      put "permissions", to: "permissions#set",
                              as: "set_permissions"
    end
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
