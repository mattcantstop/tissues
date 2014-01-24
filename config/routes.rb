Tissues::Application.routes.draw do

  namespace :admin do
    root "base#index"
    resources :users do
      resources :permissions
      put "permissions", to: "permissions#set",
                         as: "set_permissions"
    end

    resources :states do
      member do
        get :make_default
      end
    end
  end

  root "projects#index"
  resources :users

  post "/signin", to: "sessions#create"
  get "sessions/new"
  get "/signin", to: "sessions#new"
  delete "/signout", to: "sessions#destroy", as: "signout"

  resources :projects do
    resources :tickets do
      collection do
        get :search
      end
    end
  end

  resources :tickets do
    resources :comments
    resources :tags do
      member do
        delete :remove
      end
    end
  end

  resources :files

end
