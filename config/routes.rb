Rails.application.routes.draw do
  
  root 'static_pages#home'
  get  '/about' , to:'static_pages#about'
  get '/signup' ,    to:'users#new'
  get    '/login',   to: 'sessions#new'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get '/micropost_comments', to:'micropost#show'
  post '/micropost_comments', to:'micropost#create'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:show, :create, :destroy]
  resources :comments,            only: [:create, :destroy]
  resources :likes,               only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
