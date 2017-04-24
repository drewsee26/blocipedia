Rails.application.routes.draw do

  devise_for :users
  resources :wikis do
    resources :collaborators, only: [:index, :create, :destroy]
  end
  
  get 'charges/downgrade'
  resources :charges, only: [:new, :create, :downgrade]
  
  
  root 'welcome#index'


end
