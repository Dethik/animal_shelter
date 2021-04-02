Rails.application.routes.draw do
  resources :dogs
  resources :cats
  get '/random_dog', to: 'dogs#random'
  get '/random_cat', to: 'cats#random'
end
