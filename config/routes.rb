Rails.application.routes.draw do
  resources :coffee_breaks
  resources :users
  post '/login', to: 'authentication#login'
  get '/profile', to: 'users#profile'
  delete '/coffee_breaks', to: 'coffee_breaks#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
