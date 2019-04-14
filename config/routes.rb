Rails.application.routes.draw do
  root 'home#index'
  resources :answers
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  post '/update_password', to: 'users#update_password'
  post '/update_answers', to: 'users#update_answers'
  post '/update_username', to: 'users#update_username'
  post '/update_house', to: 'users#update_house'
  post '/update_house_answers', to: 'users#update_house_answers'

  post '/update_question_answers', to: 'deaths#update_answers'

  post '/leaderboards', to: 'users#create'

  get '/reset_entry', to: 'users#reset_entry'
  get '/user/character_status', to: 'users#character_status'
  get '/user/walker', to: 'users#walker'
  get '/user/paid', to: 'users#paid'

  get 'signup', to: 'users#new', as: 'signup'
  get '/account/:uuid', to: 'users#edit', as: 'edit_user'
  get '/predictions/:uuid', to: 'users#show', as: 'user'
  get '/leaderboards', to: 'users#index', as: 'users'
  get '/spoilerfree', to: 'home#show', as: 'spoilerfree'
  get '/drinking', to: 'drinks#index', as: 'drinks'
  get '/rules', to: 'rules#index', as: 'rules'
  get '/statistics', to: 'characters#index', as: 'characters'
  get '/houses', to: 'houses#index'
  get '/house/:name', to: 'houses#show', as: 'house'

  post 'alive', to: 'characters#alive'
  get 'dead', to: 'characters#dead'
  get 'wight', to: 'characters#wight'

  get 'death', to: 'deaths#index', as: 'deaths'
  get 'death/status', to: 'deaths#status'

  delete '/users/:uuid', to: 'users#destroy', as:'destroy_user'

end
