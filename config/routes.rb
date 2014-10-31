Rails.application.routes.draw do
    
  root to: "static_pages#index"
  
  resources :users
  resource :session
  resources :bands
  resources :albums
  resources :songs
  resources :taggings
  resources :followings
  resources :collections
  resources :static_pages
  
end

