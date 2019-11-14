
Rails.application.routes.draw do
  
  root to: 'pages#index'
  get 'speak/watson'
  get 'speak/star_wars'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    devise_for :users do
      get '/users/sign_out' => 'devise/sessions#destroy'
   end


   get '/form', to: 'pages#form'
  get '/residential', to: 'pages#residential'
  get '/commercial', to: 'pages#commercial'
  get '/google', to: 'google#index'
  get '/quote_confirm', to: 'pages#quote_confirm'
  get '/terms_and_conditions', to: 'pages#terms_and_conditions'
  get 'interventions/new'  
  get 'get_courses_by_location/:location_id', to: 'courses#get_courses_by_location'  
  get '/course_search' => 'courses#course_search'

  #get '/leads', to: 'leads#create'
 

  get 'home/index'


  resources :quotes
  resources :employees
  resources :leads
  resources :interventions, only: :index
  resources :customer, only: [] do
  end
  resources :building, only: [] do

  # get '/WatsonSpeaker/watson'

  # Rails.application.routes.draw do
  # get 'speak/watson'
  #   devise_for :users, controllers: {
  #     sessions: 'users/sessions'
  #   }
  # end
  end  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  
  
 


end

