Rails.application.routes.draw do

  resources :addresses
  resources :companies
  resources :contacts
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  resources :users

  # You can have the root of your site routed with "root"
  root 'home#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
