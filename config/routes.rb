Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  
  resources :books, only: [:new, :create, :index, :edit, :show, :destroy, :update]
  resources :users, only: [:show, :edit, :update, :index]
  
  get "homes/about" => "homes#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
