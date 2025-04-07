Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  resources :meals

  get "meals_by_day/:week_id", to: "meals#meals_by_day", as: "meals_by_day"
  get "/users/sign_out", to: "home#signout"

  authenticated :user do
    root to: "meals#after_sign_in_path_for", as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  namespace :api do
    namespace :v1 do
      resources :weeks, only: [ :index, :show ]
      resources :user_day_meals, only: [ :create, :destroy ]
      resources :user_meal_likes, only: [ :create, :destroy ]
    end
  end
end
