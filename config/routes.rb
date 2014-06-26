Rails.application.routes.draw do
  root "cohorts#index"
  get '/:uuid' => 'cohorts#index'
  post '/cohorts' => 'cohorts#create'

  post '/visitors' => 'visitors#create'
  post '/visitors/inquire' => 'visitors#inquire'

  resources :students, only: [:show, :create]
end
