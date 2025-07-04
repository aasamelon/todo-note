Rails.application.routes.draw do
  devise_for :users

  root to: "dashboards#index"

resources :dashboards, only: [:index] do
  post :create_todo, on: :collection
  #post :create_wish, on: :collection
end

resources :todos, only: [:index, :update, :destroy]

  
  get "up" => "rails/health#show", as: :rails_health_check
end
