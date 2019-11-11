
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

  #get '/leads', to: 'leads#create'
 

  get 'home/index'
  
  resources :quotes
  resources :employees
  resources :leads

  # get '/WatsonSpeaker/watson'

  # Rails.application.routes.draw do
  # get 'speak/watson'
  #   devise_for :users, controllers: {
  #     sessions: 'users/sessions'
  #   }
  # end

end
