Rails.application.routes.draw do
  root "users#index"
  resources :users
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  get '/welcome', to: 'session#welcome'
  get '/authorized', to: 'session#page_requires_login'



  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   #root "users#new"
end
