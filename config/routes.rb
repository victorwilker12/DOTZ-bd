Rails.application.routes.draw do
  resources :products do 
    resources :purchases
  end
  
  devise_for :admins
  devise_for :clients do 
    resources :purchases
  end

  get '/minhas_compras', to: "purchases#purchases_of_client", as: "/minhas_compras"
  get '/clients', to: "clients#index"
  get '/client/:id', to: "clients#show", as: "client_show"
  # patch '/client/:id', to: "clients#update", as: "client_update"
  patch '/client/:id', to: "clients#edit", as: "client_edit_dotz"
  patch '/client/:id', to: "clients#update", as: "client_add_dotz"

  delete '/client/:id', to: "clients#destroy", as: "clients_delete"
  # resources :clients
  # get '/dotz',                  to: 'backsystem#index',    as: 'backsystem_index'
  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
