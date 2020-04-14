Rails.application.routes.draw do
  devise_for :clients

  resources :products do 
    resources :purchases
  end
  
  devise_for :admins
  devise_for :clients

  get '/minhas_compras', to: "purchases#purchases_of_client", as: "/minhas_compras"
  get '/clients', to: "clients#index", as: "/clients"
  
  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
