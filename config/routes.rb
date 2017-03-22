Rails.application.routes.draw do
  devise_for :users
  
  get "wikis/index"
  get "wikis/show"
  get "wikis/new"
  get "wikis/edit"
  post "wikis/create"
  
  
  root 'welcome#index'


end
