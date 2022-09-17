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


  #get '/annotations/:id', to: 'annotations#index', as: 'export_annotations'
  
  get '/annotations/:id/makes_sense', to: 'annotations#makes_sense', as: 'makes_sense'
  get '/annotations/:id/completeTask', to: 'annotations#edit', as: 'complete_task'
  get '/annotations/:id/completeTask2', to: 'annotations#edit2', as: 'complete_task2'
  get '/annotations/:id/completeTask3', to: 'annotations#edit3', as: 'complete_task3'
  get '/annotations/:id/completeTask4', to: 'annotations#edit4', as: 'complete_task4'
  get '/annotations/:id/completeTask5', to: 'annotations#edit5', as: 'complete_task5'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
