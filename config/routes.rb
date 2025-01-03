Rails.application.routes.draw do
  resources :notes
  resources :products
  resources :items
  get "pagesindex" => "pages#index"
  get "pages/apples" => "pages#apples"
  post "pages/add" => "pages#add"
  post "pages/remove" => "pages#remove"
  root "pages#index"
  resources :street_fighters
  resources :vehicles do
    collection do
      get :indexb
      get :indexm
    end
  end
  resources :tweets do
    member do
      get :actions
    end
  end
  resources :friendships
  devise_for :users
  resources :posts
  resources :users do
    resource :profile, only: [ :show, :edit, :update ]
    resources :messages, only: [ :index, :new, :show, :create, :destroy ]
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
end
