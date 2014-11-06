Rails.application.routes.draw do
  root to: "static_pages#home"
  #root to: "static_pages#index"
  # root to: "api/static_pages#index"
  
  get 'dashboard' => 'static#dashboard', as: "dashboard"
   
  namespace :api, :defaults => { :format => :json } do
    get 'dashboard' => 'dashboard', as: "dashboard"
    resources :bands 
    resources :albums
    resources :songs
    resources :users
    
    get 'myBands' => 'bands#myBands', as: "myBands"
    get 'myAlbums' => 'albums#myAlbums', as: "myAlbums"
    get 'mySongs' => 'songs#mySongs', as: "mySongs"
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