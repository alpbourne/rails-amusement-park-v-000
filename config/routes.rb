Rails.application.routes.draw do
  root 'welcome#home'
  resources :users
  resources :attractions
  resources :sessions, only: [:destroy, :create, :new]

  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  post "/rides/new", to: "rides#new"
end
