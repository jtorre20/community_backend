Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  post '/users/username', to: 'users#show'
  post '/moodentry', to: 'moods#find'
  # post '/text', to: 'text#create'

  
  resources :users, only: [:index, :new, :show, :create, :destroy, :update]
  resources :moods, only: [:index, :new, :show, :create, :destroy, :update]
  resources :texts
  # resources :text, only: [:index, :new, :show, :create, :destroy, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
