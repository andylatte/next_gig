Rails.application.routes.draw do
  
  root to: 'welcome#index'
  
  resources :tours, :only => [:index, :show]
  
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
        resources :primary_hotels
        resources :secondary_hotels
        resources :driver_hotels
        resources :travel_schedule_items
        resources :show_schedule_items
        resources :promo_schedule_items
        resources :travel_schedules, :only => [:new, :create]
        resources :show_schedules, :only => [:new, :create]
      end
    end
  end


  get 'welcome/index'


  devise_for :users
  
  resources :users
  
end
