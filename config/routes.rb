Rails.application.routes.draw do
  get 'users/new'
  root "static_pages#home"
  get '/instructions', to: 'static_pages#instructions'
  get '/signup', to: 'users#new'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
