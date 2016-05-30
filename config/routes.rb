Rails.application.routes.draw do
  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'sessions', only: [:create]
  # handle user feedback
  resource :feedback, controller: 'feedback', only: [:show]
  # MFA redirect
  resource :active_challenge, :only => [:show]
  resource :active_lock, :only => [:show]

  resources :users, controller: 'users', only: [:create] do
    resource :password,
      controller: 'passwords',
      only: [:create, :edit, :update]
  end

  resource :account, :only => [:show, :update]

  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  get '/sign_up' => 'clearance/users#new', as: 'sign_up'

  get '/challenge' => 'challenge#get'
  post '/castle_hook' => 'castle_hook#post'

  delete '/sign_out' => 'sessions#destroy', as: 'sign_out'

  root 'application#index'
end
