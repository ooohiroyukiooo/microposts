Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'static_pages#home'
  get 'signup',  to: 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'edit', to: 'users#edit'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :microposts
  resources :relationships, only: [:create, :destroy]

end
