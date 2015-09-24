Rails.application.routes.draw do
  root 'web#welcome'

  get 'search', to: 'search#index'
  get '/search/show', to: 'search#show'

  get 'web', to: 'web#index'
  get 'web/data', :defaults => { :format => 'js' }
  get 'web/show', to: 'web#show'

  devise_for :users
  resources :genres

  resources :artists

  resources :users
end
