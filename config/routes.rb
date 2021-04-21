Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  resources :tags, only: [:index]
  resources :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
