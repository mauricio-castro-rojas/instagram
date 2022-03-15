Rails.application.routes.draw do
  devise_for :accounts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "accounts#home"
  #get "/accounts", to: "accounts#home"
  #get "/accounts/:id", to: "accounts#home"
  resources :accounts

  # Defines the root path route ("/")
  # root "articles#index"
end
