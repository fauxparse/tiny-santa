Rails.application.routes.draw do
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  match '/auth/failure', to: redirect('/'), via: 'get'

  root to: 'exchanges#show'
end
