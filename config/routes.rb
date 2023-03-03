Rails.application.routes.draw do
  root 'pages#kitchensink'
  
  resources :tweets
  devise_for :users
  
  get 'multiple_select', to: 'pages#multiple_select'
  get 'online_users', to: 'pages#online_users'
  get 'modal', to: 'pages#modal'
  
  resources :technologies, only: [:create]
  resources :favourite_technologies, only: [:create, :destroy]

  resources :recipes, except: [:destroy]
  resources :ingredients, only: [:destroy]
  resources :nested_ingredients, only: [:new, :destroy]
  resources :characters, only: [:index, :destroy]

  resources :chatrooms, only: [:index, :show] do 
    resources :messages, only: [:create]
  end

  resources :tic_tac_toe_games, only: [:index, :show, :create] do
    resources :tic_tac_toe_moves, only: [:create], as: :moves
  end

  namespace :onboarding do
    resources :developer_informations, only: %i[new create]
    resources :developer_skills, only: %i[new create]
    resources :developer_preferences, only: %i[new create]
  end

  resources :developers, only: %i[show]
  resources :commands, only: %i[index]
  resources :places, only: %i[index create]
end
