Rails.application.routes.draw do
  
  devise_for :users
  root to: "cards#index" 
  
  resources :users

  resources :rooms
  resources :cards, only: [:index,:create]
  
end
