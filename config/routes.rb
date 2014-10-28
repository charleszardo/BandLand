Rails.application.routes.draw do
  root to: "static_pages#root"

  resources :users
  resource :session
  resources :bands
  resources :albums
  resources :songs
end
