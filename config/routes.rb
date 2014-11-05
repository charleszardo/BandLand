Rails.application.routes.draw do
  root to: "site#root"
  # root to: "static_pages#index"
  
  namespace :api, :defaults => { :format => :json } do
    resources :bands 
    resources :albums
    resources :songs
  end
  
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