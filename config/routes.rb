Rails.application.routes.draw do

  devise_for :users
  resources :wikis do
    resources :collaborators
  end
  
  get 'charges/downgrade'
  resources :charges, only: [:new, :create, :downgrade]
  
  
  root 'welcome#index'


end
