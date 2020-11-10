Rails.application.routes.draw do
  
  devise_for :users
  root to: "cards#index" 
  
  resources :users, only: :show 

  resources :rooms, only: [:create,:show] do
    resources :cards, only: [:index,:new,:create]
  end
  
end
