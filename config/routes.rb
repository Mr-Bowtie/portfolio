Rails.application.routes.draw do
  get 'portfolio/display'
  root 'portfolio#display'
  resources :contacts, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
