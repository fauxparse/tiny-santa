Rails.application.routes.draw do
  get '/signup', to: 'signups#new', as: :signup
  post '/signup', to: 'signups#create'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: redirect('/'), via: 'get'
  get '/login', to: redirect('/auth/twitter'), as: :login
  get '/logout', to: 'sessions#destroy'

  resource :address, only: %i[show edit update]

  root to: 'christmases#show'
end
