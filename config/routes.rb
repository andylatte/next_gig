Rails.application.routes.draw do
  
  root to: 'welcome#index'
  
  namespace :admin do
    get 'welcome/index'
    resources :users
    resources :tours do
      member do
        get 'assign_crew_members'
        post 'update_crew_members'
      end
      
      resources :tour_days, shallow: true do
        resources :venues
        resources :cargos
        resources :productions
      end
    end
  end


  get 'welcome/index'


  devise_for :users
  
  resources :users
  
end
