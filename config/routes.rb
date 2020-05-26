Rails.application.routes.draw do
  resources :works
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "works#top_ten"
  resources :users
end
