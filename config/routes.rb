Rails.application.routes.draw do
  resources :clients, only: [:create] do
    resources :workouts, only: [:create]
  end

  namespace :clients do
    resources :workout_items, only: [:update]
  end
end
