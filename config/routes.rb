Rails.application.routes.draw do
  get '/' => 'static#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :genres
  resources :gigs
  resources :venues
  resources :bands
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
