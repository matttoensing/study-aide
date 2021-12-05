Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  post '/login', to: 'sessions#create'

  get '/register', to: 'users#new', as: 'register'
  post '/register', to: 'users#create'
  get '/dashboard', to: 'users#show'

  get '/quizzes/:id/game', to: 'game#show'

  resources :questions do
    resources :answers, only: [:update]
  end

  resources :quizzes do
    resources :questions, only: [:new, :create, :update, :destroy]
  end
end
