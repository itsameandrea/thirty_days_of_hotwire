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
  resources :todos, only: %i[index update]
  resources :coffee_prompts, only: %i[new create]

  get 'tabs', to: 'pages#tabs'
  get 'profile_tab', to: 'pages#profile_tab'
  get 'personal_info_tab', to: 'pages#personal_info_tab'
  get 'notifications_tab', to: 'pages#notifications_tab'

  resources :posts, only: %i[new create edit update show]
  resources :slow_characters, only: %i[index]

  resources :profiles, only: %i[index]

  resources :pizzas, only: %i[index]
  resources :toppings, only: %i[index]

  resources :kanban_boards, only: %i[show]
  resources :kanban_columns, only: %i[update]
  resources :kanban_cards, only: %i[update]
  
  resources :users, only: %i[show]
  resources :follows, only: %i[create]
  
  resources :emails, only: %i[index]
  namespace :emails do
    resource :bulk, only: :destroy, controller: :bulk
  end

  resources :comments, only: %i[index new create show] do
    resources :replies, only: %i[new create]
  end
end
