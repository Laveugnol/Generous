Rails.application.routes.draw do


  get 'users/twilio_response'

root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :players
resources :orders, only: [:show, :create]
resources :orders, only: [:show, :create] do
  resources :payments, only: [:new, :create]
  end
resources :users
end
