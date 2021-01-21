Rails.application.routes.draw do

  root 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/help' => 'static_pages#help'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'following/:id' => 'follows#following'
  get 'followed/:id' => 'follows#followed'
  get 'search' => 'posts#search'

  resources :users
  resources :posts
  resources :likes, only: [:update, :destroy]
  resources :follows, only: [:update, :destroy]

end
