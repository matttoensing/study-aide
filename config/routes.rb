Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  post '/login', to: 'sessions#create'
  
  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'
  get '/dashboard', to: 'users#show'
end
