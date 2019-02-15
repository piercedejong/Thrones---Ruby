Rails.application.routes.draw do
  root 'home#index'
  resources :users
  resources :answers
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/user/dead', to: 'users#dead'
  get '/user/walker', to: 'users#walker'
  get '/user/paid', to: 'users#paid'
  get 'leaderboards', to: 'users#index', as:'leaderboards'

  get 'spoilerfree', to: 'home#show', as: 'spoilerfree'

  get 'drink', to: 'drinks#index', as: 'drink'

  get 'rules', to: 'rules#index', as: 'rules'

  get 'statistics', to: 'characters#index', as: 'statistics'
  post 'alive', to: 'characters#alive'
  get 'dead', to: 'characters#dead'
  get 'wight', to: 'characters#wight'

  get 'death', to: 'deaths#index', as: 'death'
  get 'death/status', to: 'deaths#status'
end
