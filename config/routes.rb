Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "tours#index"
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  
  resources :users, only: [:new, :create] do
    member do
      get :tours
    end
  end  
  
  resources :tours
  
  resources :itineraries, only: [:new, :create, :edit, :update, :destroy, :show]
end
