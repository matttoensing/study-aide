Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'
end
