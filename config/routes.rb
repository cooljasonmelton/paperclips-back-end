Rails.application.routes.draw do

  resources :users, only: [:create]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

  resources :prompts
  resources :entries
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
