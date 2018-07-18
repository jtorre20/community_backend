Rails.application.routes.draw do
  scope module: :v1 do
    resources :goals
    resources :moods
    resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
