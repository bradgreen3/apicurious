Rails.application.routes.draw do
  root 'home#index'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :commits, only: [:index]
  resources :repos, only: [:index]
  resources :starred_repos, only: [:index]
  resources :organizations, only: [:index]
  resources :dashboard, only: [:index]

end
