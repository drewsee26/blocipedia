Rails.application.routes.draw do
  devise_for :users
  
  resources :charges, only: [:new, :create]
  resources :wikis
  root 'welcome#index'


end
