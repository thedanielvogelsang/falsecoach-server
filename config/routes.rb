Rails.application.routes.draw do
  resources :clients, only: [:create] do
    resources :workouts, only: [:create]
  end
end
