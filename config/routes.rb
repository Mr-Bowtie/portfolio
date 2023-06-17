Rails.application.routes.draw do
  get '/home', to: 'portfolio#home'
  get '/about', to: 'portfolio#about'
  get '/portfolio', to: 'portfolio#portfolio'
  root 'portfolio#home'
  resources :contacts, only: %i[new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
