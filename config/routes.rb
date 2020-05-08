Rails.application.routes.draw do
  root 'events#index'
  resources :events do
    member do
      post 'attend', to: 'invitations#create'
      delete 'unattend', to: 'invitations#destroy'
    end
  end

  resources :users

  get 'sessions/new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
