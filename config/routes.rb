Rails.application.routes.draw do
  devise_for :users
  root 'pages#kitchensink'
  
  get 'multiple_select', to: 'pages#multiple_select'
  
  resources :technologies, only: [:create]
  resources :favourite_technologies, only: [:create, :destroy]
end
