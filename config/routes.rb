Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "about", to: "about#index"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"

  post "sign_up", to: "registration#create"
  get "sign_up", to:"registration#new"

  get "sign_in", to:"sessions#new"
  post "sign_in", to: "sessions#create"

  delete "logout", to:"sessions#destroy"

  get "password/reset", to:"password_resets#new"
  post "password/reset", to:"password_resets#create"

  get "password/reset/edit", to:"password_resets#edit"
  patch "password/reset/edit", to:"password_resets#update"

  get "auth/twitter/callback", to: "omniauth_callbacks#twitter"

  resources :twitter_accounts
  resources :tweets

  # get "/", to: "main#index"
  root to: "main#index"
end
