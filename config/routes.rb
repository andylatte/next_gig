Rails.application.routes.draw do
  
  root to: 'welcome#index'
  
  namespace :admin do
    get 'welcome/index'
    resources :users
  end

  get 'welcome/index'


  devise_for :users
  
  resources :users
  
end
