Rails.application.routes.draw do
  resources :events
  resources :users

  get 'sessions/new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
