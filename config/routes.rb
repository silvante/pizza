Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }

  namespace :admin do
    resources :products
    resources :categories
    resources :users
    resources :deliveries
    resources :orders do
      member do
        patch "commit"
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "home#index"

  get "/admin", to: "admin#index"

  resources :users do
    member do
      get :history
    end
  end
  resources :products
  resources :categories
  resources :delivery, only: %i[show]
  resources :orders do
    member do
      patch "checkout"
    end
  end
  resources :cart do
    post "add_to_cart", on: :collection
  end
end
