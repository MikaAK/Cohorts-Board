Rails.application.routes.draw do
  root "cohorts#index"
  get '/:uuid', to: 'cohorts#index'

  resources :cohorts, only: [:index, :create]

  post '/visitors' => 'visitors#new'
  post '/visitors/inquire' => 'visitors#inquire'
end
