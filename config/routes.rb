Rails.application.routes.draw do

  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/tasks',  to: 'tasks#all'
  get '/change', to: 'tasks#changestatus'

  resources :events do
    resources :tasks do
      member do
        get 'deallocate'
      end
      resources :expenses
    end
  end

  resources :users


end
