Rails.application.routes.draw do
  root 'search#index'
  get '/search', to: 'search#show'
  

  get 'web', to: 'web#index'

  get 'web/data', :defaults => { :format => 'js' }

  devise_for :users
  resources :genres

  resources :artists

  resources :users
end
