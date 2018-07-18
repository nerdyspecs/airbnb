Rails.application.routes.draw do
  get 'braintree/new'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :listings do
    resources :reservations 
  end
  resources :users,:test
  root "welcome#index"
  get "/main" =>"users#homepage", as: "homepage"
  get "user/:id/reservations" => "users#reservations", as: "user_reservations"

  get "reservation/:id/braintree/new" => "braintree#new", as:"new_braintree"
  post "reservations/:id/braintree/checkout" => "braintree#checkout", as:"checkout_braintree"
  get "search" =>"listings#search", as:"search"
end
