Rails.application.routes.draw do
  
  root to: 'welcome#index'
  
  namespace :admin do
    get 'welcome/index'
    resources :users
    resources :tours do
      resources :tour_days
      member do
        get 'assign_crew_members'
        post 'update_crew_members'
      end
    end
  end

  get 'welcome/index'


  devise_for :users
  
  resources :users
  
end
