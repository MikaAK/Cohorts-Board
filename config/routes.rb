Rails.application.routes.draw do
  root "cohorts#index"
  get '/:uuid' => 'cohorts#index'
  post '/cohorts' => 'cohorts#create'

  post '/visitors' => 'visitors#create'
  post '/visitors/inquire' => 'visitors#inquire'


  put '/students/:id' => 'students#update'
  resources :students, only: [:show, :create]
end
