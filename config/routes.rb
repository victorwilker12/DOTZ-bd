Rails.application.routes.draw do
  resources :products do 
    resources :purchases
  end
  
  devise_for :admins
  devise_for :clients
  
  # devise_for :admins, controllers: { sessions: 'admins/sessions' }
  # devise_for :clients, controllers: { sessions: 'clients/sessions' }
  root to: 'dashboard#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
