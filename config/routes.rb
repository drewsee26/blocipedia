Rails.application.routes.draw do
  devise_for :users
  
  get 'charges/downgrade'
  
  resources :charges, only: [:new, :create, :downgrade]
  resources :wikis
  root 'welcome#index'


end
