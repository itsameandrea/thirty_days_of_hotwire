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
end
