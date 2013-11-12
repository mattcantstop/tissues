Tissues::Application.routes.draw do

  root "projects#index"
  resources :users

  get "sessions/new"
  #post "sessions/new"
  post "/signin", to: "sessions#create"
  get "/signin", to: "sessions#new"

  resources :projects do
    resources :tickets
  end

end
