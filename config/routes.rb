
Rails.application.routes.draw do
  
  
  get 'speak/watson'
  get 'speak/star_wars'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#index'
  get '/form', to: 'pages#form'
  get '/residential', to: 'pages#residential'
  get '/commercial', to: 'pages#commercial'
  get '/google', to: 'google#index'
  get '/quote_confirm', to: 'pages#quote_confirm'
  get '/terms_and_conditions', to: 'pages#terms_and_conditions'
  get 'interventions/new'  
  get 'get_buildings_by_customer/:customer_id', to: 'intervention#get_buildings_by_customer'  
  get '/buildings_search' => 'intervention#building_search'
  get 'get_battery_by_buildings/:buildings_id', to: 'intervention#get_battery_by_buildings'  
  get '/battery_search' => 'intervention#battery_search'
  get '/get_column_by_battery/:battery_id', to: 'intervention#get_column_by_battery'  
  get '/column_search' => 'intervention#column_search'
  get '/get_elevator_by_column/:column_id', to: 'intervention#get_elevator_by_column'  
  get '/elevator_search' => 'intervention#elevator_search'
  #get '/leads', to: 'leads#create'
 

  get 'home/index'
  
  resources :quotes
  resources :employees
  resources :leads
  resources :interventions

  # get '/WatsonSpeaker/watson'

  # Rails.application.routes.draw do
  # get 'speak/watson'
  #   devise_for :users, controllers: {
  #     sessions: 'users/sessions'
  #   }
  # end

end
