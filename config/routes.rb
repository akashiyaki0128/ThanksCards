Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'activities', to: 'users/registrations#new_activity'
    post 'activities', to: 'users/registrations#create_activity'
    post 'guest_sign_in', to: 'users/sessions#new_guest'
  end
  root to: "cards#index" 
  
  resources :users, only: [:show,:edit,:update] do
    collection do
      get 'search'
    end
  end
  resources :cards, only: [:index,:new,:create,:edit,:update] do
    post 'like' => 'likes#create'
    delete '/like' => 'likes#destroy'
  end
end
