Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'
  get '/dashboard', to: 'users#show'

  get '/discover', to: 'search#index'

  resources :questions do
    resources :answers, only: [:update]
  end

  resources :quizzes do
    resources :questions, only: [:new, :create, :update, :destroy]
  end

  resources :assessments, only: [:show, :create, :update]
end
