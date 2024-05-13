Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about", as:"homes_about"
  
  resources :books, only: [:create, :index, :edit, :show, :destroy, :update]
  resources :users, only: [:show, :edit, :update, :index, :create]
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
