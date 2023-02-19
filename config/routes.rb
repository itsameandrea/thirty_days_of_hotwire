Rails.application.routes.draw do
  root 'pages#kitchensink'
  
  resources :technologies, only: [:create]
  resources :favourite_technologies, only: [:create, :destroy]
end
