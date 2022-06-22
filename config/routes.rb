Rails.application.routes.draw do
  root "static_pages#home"
  get '/instructions', to: 'static_pages#instructions'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
