Rails.application.routes.draw do
  devise_for :users
  root 'pages#kitchensink'
  
  get 'multiple_select', to: 'pages#multiple_select'
  get 'online_users', to: 'pages#online_users'
  
  resources :technologies, only: [:create]
  resources :favourite_technologies, only: [:create, :destroy]
end
