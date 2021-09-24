Rails.application.routes.draw do
  resources :posts
  post "api/applicant/confirm", to: "applicant#confirm"
  get "api/applicant", to: "applicant#index"
  get "/api/applicant/detail", to: "applicant#details"
  delete "/api/applicant/destroy", to: "applicant#destroy"
  post "/api/applicant/create", to: "applicant#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :users, only: [:create]
  post "/auth/login", to: "users#login"
  get "/auth/auto_login", to: "users#auto_login"
end
