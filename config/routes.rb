Rails.application.routes.draw do
  resources :users 
  resources :annotations
  get 'sessions/new'
  get 'users/new'
  root "static_pages#home"
  get '/find_incomplete_annotation' => 'application#findIncompleteAnnotation', :as => 'find_incomplete_annotation'
  get '/instructions', to: 'static_pages#instructions'
  get '/taskComplete', to: 'static_pages#annotationsCompleted'
  get '/signup', to: 'users#new'
  get  '/login',   to: 'sessions#new'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  
  get '/annotations/:id/completeTask', to: 'annotations#edit', as: 'complete_task'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
