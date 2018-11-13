Rails.application.routes.draw do
  resources :clients, only: [:create]
end
