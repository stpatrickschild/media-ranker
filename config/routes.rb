Rails.application.routes.draw do
  root to: "works#top_ten"
  get "/login", to: "users#login_form", as: :login
  post "/login", to: "users#login"
  post "/logout", to: "users#logout", as: :logout
  patch "/works/:id/upvote", to: "votes#upvote", as: :upvote
  resources :votes
  resources :works
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :users
 
end
