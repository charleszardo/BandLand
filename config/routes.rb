Rails.application.routes.draw do
  # root to: "static_pages#root"
  root to: "sessions#new"

  resources :users
  resource :session
  resources :bands
  resources :albums
  resources :songs
  resources :taggings
  resources :followings
  resources :collections
  
end
