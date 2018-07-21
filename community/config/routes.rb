Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  # post '/login', to: "sessions#create"
  post '/users/username', to: 'users#show'
  # resources :about
  
  resources :users, only: [:index, :new, :show, :create, :destroy, :update]
  resources :moods, only: [:index, :new, :show, :create, :destroy, :update]
  scope module: :v1 do
    resources :goals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
