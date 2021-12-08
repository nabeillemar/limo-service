Rails.application.routes.draw do

  resources :drivers
  root 'sessions#home'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  match '/auth/github/callback' =>  'sessions#gitcreate', via: [:get, :post]

  resources :users

  resources :trips

  resources :drivers do
    resources :trips, only: [:show, :index]
  end 






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
