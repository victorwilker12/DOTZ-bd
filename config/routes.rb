Rails.application.routes.draw do
  get '/users', to: "users#index", as: "users_index"
  patch '/users/:user_id', to: "users#update", as: "user_update"
  # post '/users/:user_id/add_dotz', to: "users#add_dotz", as: "users_add_dotz"

  devise_for :users
  resources :products do 
    resources :purchases
  end
  
  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
