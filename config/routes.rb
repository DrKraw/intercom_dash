Rails.application.routes.draw do
  # resources :users
  # get 'about', to: 'pages#about'
  root 'home#index'

  get 'home', to: 'home#index'
  resources :home, except: [:index]

  get 'dashboard', to: 'dashboard#index'

  get 'signup', to: 'users#new'
  resources :users, except: [:new, :index, :show]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
