Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'edit', to: 'users#edit'

  resources :users do
      member do
      get :followings
      get :followers
    end
  end

  #resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end