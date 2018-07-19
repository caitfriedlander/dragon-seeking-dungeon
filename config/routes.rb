Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#show', page: 'home'
  resources :users
  resources :campaigns do
    resources :signups, shallow: true
  end
  get '/notifications', to: 'signups#index', as: 'notifications'
  resources :sessions, only: [:new, :create, :destroy]
  # Create a better looking URL for logging in
  get '/login', to: 'sessions#new'
end
