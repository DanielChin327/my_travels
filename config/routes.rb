Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "countries#index"

  resources :countries, only: [:index, :show] do
    resources :posts
  end
  resources :posts, only: [:destroy]


  get "up" => "rails/health#show", as: :rails_health_check
end
