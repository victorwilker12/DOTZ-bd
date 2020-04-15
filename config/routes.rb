Rails.application.routes.draw do

  resources :products do 
    resources :purchases
  end
  
  devise_for :admins
  devise_for :clients

  get '/minhas_compras', to: "purchases#purchases_of_client", as: "/minhas_compras"
  get '/clients', to: "clients#index", as: "/clients_index"
  
  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
