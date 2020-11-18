Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'activities', to: 'users/registrations#new_activity'
    post 'activities', to: 'users/registrations#create_activity'
  end
  root to: "cards#index" 
  
  resources :users, only: [:show,:edit,:update]
  resources :cards, only: [:index,:new,:create]
  
end
