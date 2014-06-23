Rails.application.routes.draw do
  root "cohorts#index"
  get 'cohorts/:id/uuid=:uuid', to: 'cohorts#show'

  resources :cohorts, only: [:index, :create, :show]

  post '/visitors' => 'visitors#new'

  post '/visitors/inquire' => 'visitors#inquire'
end
