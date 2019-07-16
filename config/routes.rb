Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :families
  resources :families, only: [:show] do
    resources :roles, only: [:new, :create, :destroy]
  end
  resources :tags, only: [:create]
  #resources :roles, only: [:create]
  #get '/users/new' => 'users#new'
  #post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  

  root 'application#index'
end
