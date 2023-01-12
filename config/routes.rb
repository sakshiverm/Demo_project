Rails.application.routes.draw do
  root "posts#index"
  #get 'session/new'
  #get 'session/create'
  #get 'session/destroy'
  
  get '/sign_in', to: 'session#new'
  get '/sign_out', to: 'session#destroy'
  post '/register', to: 'users#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/register', to: 'users#new'

  resources :users#, only: [:create]

  # Defines the root path route ("/")
  resources :posts do
    resources :comments
  end
   
end
