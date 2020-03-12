Rails.application.routes.draw do
  root 'static#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/session', to: 'sessions#destroy'
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  resources :genres
  resources :gigs
  resources :venues do
    resources :gigs
  end
  resources :bands do
    resources :gigs
  end
  resources :users
  resources :venue_users
  resources :band_users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
